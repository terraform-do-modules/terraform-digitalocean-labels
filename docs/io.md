# Inputs and Outputs: terraform-digitalocean-labels

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `name` | Name (e.g. `app` or `cluster`). | `string` | `""` | no |
| `environment` | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| `label_order` | Ordered list of context keys used to compose the resource ID, e.g. `["name", "environment"]`. | `list(any)` | `["name", "environment"]` | no |
| `attributes` | Additional suffix attributes appended to the composed ID (e.g. `["private"]`). | `list(any)` | `[]` | no |
| `managedby` | ManagedBy identifier, e.g. `terraform-do-modules` or `hello@clouddrove.com`. | `string` | `"terraform-do-modules"` | no |
| `enabled` | Set to `false` to prevent the module from creating any resources and return empty outputs. | `bool` | `true` | no |
| `delimiter` | Delimiter used to join the label components (e.g. `name`, `environment`, and `attributes`). | `string` | `"-"` | no |

---

## Outputs

| Name | Description |
|------|-------------|
| `id` | Disambiguated, normalized resource ID composed from `label_order` components and `attributes`. Used as a name prefix in downstream modules. |
| `name` | Normalized name tag value (e.g. `Name:-app`). |
| `environment` | Normalized environment tag value (e.g. `Environment:-test`). |
| `managedby` | Normalized managedby tag value (e.g. `Managedby:-terraform-do-modules`). |
