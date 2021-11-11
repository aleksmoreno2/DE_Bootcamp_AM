provider "google" {
  credentials = file("tf_am_auth.json")
  project = var.project_id
  region  = var.region
}