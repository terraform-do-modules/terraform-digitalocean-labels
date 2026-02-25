## [1.0.5] - 2026-02-25

### 📚 Documentation
- Added `docs/architecture.md` — architecture guidance and operational checklist
- Added `docs/io.md` — full inputs/outputs reference table

### 💡 Examples
- Added `_examples/basic/` — minimal usage example
- Added `_examples/terragrunt/` — Terragrunt example with DO Spaces remote state and OpenTofu support

### 👷 CI/CD & GitHub
- Added `.github/ISSUE_TEMPLATE/` — bug report, feature request, and config templates
- Added `SECURITY.md` — vulnerability reporting policy
- Standardized all workflow SHA pins and removed `workflows.old/`
- Updated `dependabot.yml` to track `_examples/basic/`
- Upgraded `.pre-commit-config.yaml` to gruntwork-io/pre-commit v0.1.23 and pre-commit-hooks v4.5.0

## [1.0.3] - 2026-02-06

### Changes
- 🐛 fix: update tf-checks workflow to match available examples
- ⬆️ upgrade: update examples to use provider >= 2.70.0
- ⬆️ Upgrade provider & standardize workflows
- 📝 Update CHANGELOG for v1.0.2
- chore: update Terraform version requirement to >= 1.5.4
- Merge pull request #13 from terraform-do-modules/fix/workflow
- fix: updated workflow files
- chore: standardize GitHub Actions workflows and fix code issues
- Merge pull request #12 from delaskoff/master
- Fix managedby output value

# Changelog
All notable changes to this project will be documented in this file.


## [1.0.2] - 2026-02-06

### ⬆️ Dependencies
- Updated Terraform version requirement to >= 1.5.4

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2023-07-20
### :bug: Bug Fixes
- [`0de28ef`](https://github.com/terraform-do-modules/terraform-digitalocean-labels/commit/0de28ef783077b1b43bc4d76a355c753b7e2fdfa) - update readme.yml *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`487d782`](https://github.com/terraform-do-modules/terraform-digitalocean-labels/commit/487d782aee8b8bfd59fcf6238c2d5ae6f491744f) - update license name in readme.yaml *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*


[1.0.0]: https://github.com/terraform-do-modules/terraform-digitalocean-labels/compare/0.0.1...1.0.0