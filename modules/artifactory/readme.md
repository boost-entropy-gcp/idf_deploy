# Terraform Module to setup Artifact Registry in GCP

This module can be used to deploy Artifact Registry in GCP.

## Providers

| Name | Version |
|------|---------|
| google-beta | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| artifactory\_member | Identities that will be granted the privilege in `role`. | `string` | n/a | yes |
| description | The user-provided description of the repository. | `string` | `"Managed by Terraform."` | no |
| format | The format of the packages that are stored in the repository. Possible values are `docker`. | `string` | `"docker"` | no |
| labels | Labels with user-defined metadata | `map(string)` | `{}` | no |
| location | The name of the location this repository is located in. | `string` | `"us-central1"` | no |
| project | The ID of the project in which the resources belongs. | `string` | n/a | yes |
| repository\_id | The last part of the repository name, for example: `repo1` | `string` | `"my-repository"` | no |
| role | The role that should be applied. | `list(string)` | <pre>[<br>  "roles/viewer"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| id | An identifier for the resource |
| name | The name of the repository. |
