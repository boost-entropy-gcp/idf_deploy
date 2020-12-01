variable "project_id" {
  description = "Bucket project id."
  type        = string
}

variable "prefix" {
  description = "Prefix used to generate the bucket name."
  type        = string
  default     = "my-unique-prefix"
}

variable "names" {
  description = "Bucket name suffixes."
  type        = list(string)
  default     = ["first", "second"]
}

variable "location" {
  description = "Bucket location."
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "Bucket storage class."
  type        = string
  default     = "MULTI_REGIONAL"
}

variable "versioning" {
  description = "Optional map of lowercase unprefixed name => boolean, defaults to false."
  type        = map
  default     = {}
}