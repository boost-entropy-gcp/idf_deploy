module "gcs_buckets" {
  source        = "terraform-google-modules/cloud-storage/google"
  version       = "~> 1.7"
  project_id    = var.project_id
  names         = var.names
  prefix        = var.prefix
  versioning    = var.versioning
  storage_class = var.storage_class
  location      = var.location
}