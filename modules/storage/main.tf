resource "google_storage_bucket" "raw_bucket" {
  name          = var.storage_bucket_rawlayer
  force_destroy = "true"
  location      = var.region
  project       = var.project_id
  storage_class = "standard"
}

resource "google_storage_bucket" "staging_bucket" {
  name          = var.storage_bucket_staginglayer 
  force_destroy = "true"
  location      = var.region
  project       = var.project_id
  storage_class = "standard"
}

#resource "google_storage_bucket_iam_member" "bucket_creator" {
#   bucket  = "${google_storage_bucket.raw_bucket.name}"
#   role    = "roles/Storage.objectAdmin"
#   member  = "serviceAccount:airflow-sa-am2@de-bootcamp-am.iam.gserviceaccount.com"
# }

# resource "google_storage_bucket_iam_member" "bucket_creator2" {
#   bucket  = "${google_storage_bucket.staging_bucket.name}"
#   role    = "roles/Storage.objectAdmin"
#   member  = "serviceAccount:airflow-sa-am2@de-bootcamp-am.iam.gserviceaccount.com"
# }