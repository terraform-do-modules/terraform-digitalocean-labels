# Architecture: terraform-digitalocean-labels

## Overview

This module provides standardized naming and tagging for DigitalOcean resources. Rather than hardcoding names and tags in every module, each module calls this labels module to derive a consistent, normalized identifier and a set of DigitalOcean Tags from a small set of common inputs.

Resources created by this module:

- `digitalocean_tag` (id) — a tag whose value is the composed resource identifier (e.g. `app-test`).
- `digitalocean_tag` (name) — a tag recording the `name` input (e.g. `Name:-app`).
- `digitalocean_tag` (environment) — a tag recording the `environment` input (e.g. `Environment:-test`).
- `digitalocean_tag` (managedby) — a tag recording the managing tool or team (e.g. `Managedby:-terraform-do-modules`).

The computed `id` output is the primary value consumed by downstream modules. It serves as the name prefix for all resources created by those modules.

---

## Label Order Convention

The `label_order` variable determines which components and in which sequence are joined to form the `id`. The default is `["name", "environment"]`, which produces identifiers such as `app-test`.

The supported context keys are `name` and `environment`. The `delimiter` variable (default `-`) separates each component. Any additional string fragments can be appended via the `attributes` variable (e.g. `["private"]` to produce `app-test-private`).

Examples:

| `name` | `environment` | `label_order` | `attributes` | Resulting `id` |
|--------|--------------|---------------|--------------|----------------|
| `app`  | `test`       | `["name", "environment"]` | `[]` | `app-test` |
| `app`  | `prod`       | `["name", "environment"]` | `["blue"]` | `app-prod-blue` |
| `app`  | `staging`    | `["environment", "name"]` | `[]` | `staging-app` |

Downstream modules typically format their resource names as:

```
format("%s-<resource-type>", module.labels.id)
```

For example: `app-test-container-registry`, `app-test-droplet-0`.

---

## How to Use Outputs in Downstream Modules

The `id` output is the most commonly used value. It is passed directly to resource `name` arguments or interpolated into `format()` calls.

Example usage in a parent module:

```hcl
module "labels" {
  source      = "terraform-do-modules/labels/digitalocean"
  version     = "1.0.4"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}

resource "digitalocean_droplet" "main" {
  name = format("%s-droplet-%s", module.labels.id, count.index)
  # ...
}
```

The `name`, `environment`, and `managedby` outputs each produce a formatted tag name (e.g. `Name:-app`) that can be applied directly as a DigitalOcean tag to any resource. Pass these tags as a list to the `tags` argument of DigitalOcean resources.

---

## Operational Checklist

- **Consistent inputs**: Always pass the same `name`, `environment`, and `label_order` values to the labels module and all child modules in a given stack. Drift in these values produces inconsistent resource names and tags.
- **Attributes for disambiguation**: When deploying multiple logical groups within the same environment (e.g. `blue`/`green` or `primary`/`replica`), use the `attributes` variable to add a distinguishing suffix.
- **Delimiter choice**: The default delimiter `-` is safe for all DigitalOcean tag and resource name character sets. Avoid using special characters.
- **enabled flag**: Setting `enabled = false` prevents all tag resources from being created and produces empty string outputs. This can be used for conditional module inclusion in higher-level compositions.
- **Tag limits**: DigitalOcean has a limit on the number of tags per resource. The labels module creates up to four tags (id, name, environment, managedby). Ensure downstream modules do not exceed the per-resource tag limit when combining labels tags with additional custom tags.
- **Renaming**: Changing `name`, `environment`, or `label_order` after initial deployment renames all resources that use `module.labels.id`. This causes Terraform to replace those resources. Plan renames carefully in production.
