resource "google_artifact_registry_repository" "my-repo" {
  provider = google-beta

  project       = var.project
  location      = var.location
  repository_id = var.repository_id
  description   = var.description
  format        = var.format
  labels        = var.labels
}

resource "google_artifact_registry_repository_iam_member" "member" {
  for_each = toset(var.role)
  provider = google-beta

  project    = var.project
  location   = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role       = each.value
  member     = var.member
}