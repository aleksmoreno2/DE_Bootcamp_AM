resource "google_service_account" "sa_airflow" {
  account_id   = var.sa_airflow
  display_name = "Airflow Service Account"
}

resource "google_project_iam_member" "service_account_bucket" {
  project =  var.project_id
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.sa_airflow.email}"
}