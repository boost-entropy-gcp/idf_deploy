variable "project" {
  description = "The ID of the project in which the resources belongs."
  type        = string
}

variable "repository_id" {
  description = "The last part of the repository name, for example: `repo1`"
  type        = string
  default     = "my-repository"
}

variable "format" {
  description = "The format of the packages that are stored in the repository. Possible values are `docker`."
  type        = string
  default     = "docker"
}

variable "labels" {
  description = "Labels with user-defined metadata"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "The name of the location this repository is located in."
  type        = string
  default     = "us-central1"
}

variable "description" {
  description = "The user-provided description of the repository."
  type        = string
  default     = "Managed by Terraform."
}

# Artifactory IAM
variable "role" {
  description = "The role that should be applied."
  type        = list(string)
  default = [
    "roles/viewer"
  ]
}

variable "member" {
  description = "Identities that will be granted the privilege in `role`."
  type        = string
  # group example "group:admins@example.com"
  # user example - "user:user@example.com"
}