terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.77.0"
    }
  }
  required_version = ">= 0.13.0"
}

provider "google" {
  credentials = file("de-bootcamp-am-auth.json")
  project = var.project_id
  region  = var.region
}