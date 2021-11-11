#module "service_account" {
#  source      = "./modules/service_account"
#  
# project_id  = var.project_id 
#  sa_airflow  = var.sa_airflow
#}

module "vpc" {
  source      = "./modules/vpc"

  project_id  = var.project_id 
}

module "gke" {
  source = "./modules/gke"

  project_id    = var.project_id
  cluster_name  = "airflow-gke-data-bootcamp"
  location      = var.location
  vpc_id        = module.vpc.vpc
  subnet_id     = module.vpc.private_subnets[0]
  gke_num_nodes = var.gke_num_nodes
  machine_type  = var.machine_type
}

module "cloudsql" {
  source = "./modules/cloudsql"

  region            = var.region
  location          = var.location
  instance_name     = var.instance_name
  database_version  = var.database_version
  instance_tier     = var.instance_tier
  disk_space        = var.disk_space
  database_name     = var.database_name
  db_username       = var.db_username
  db_password       = var.db_password
}

module "storage" {
  source = "./modules/storage"

  project_id                  = var.project_id 
  location                    = var.location
  storage_bucket_rawlayer     = var.storage_bucket_rawlayer
  # storage_bucket_staginglayer = var.storage_bucket_staginglayer
}

