output "id" {
  description = "An identifier for the resource"
  value       = google_artifact_registry_repository.my-repo.id
}

output "name" {
  description = "The name of the repository."
  value       = google_artifact_registry_repository.my-repo.name
}