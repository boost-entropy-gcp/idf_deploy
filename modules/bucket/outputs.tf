output "bucket" {
  description = "Bucket resource (for single use)."
  value       = module.gcs_buckets.first_bucket
}

output "name" {
  description = "Bucket name (for single use)."
  value       = module.gcs_buckets.first_bucket.name
}

output "buckets" {
  description = "Bucket resources as list."
  value       = module.gcs_buckets.buckets_list
}

output "buckets_map" {
  description = "Bucket resources by name."
  value       = google_storage_bucket.buckets
}

output "names" {
  description = "Bucket names."
  value = { for name, bucket in google_storage_bucket.buckets :
    name => bucket.name
  }
}

output "names_list" {
  description = "List of bucket names."
  value       = module.gcs_buckets.buckets_list[*].name
}