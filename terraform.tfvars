project_id = "de-bootcamp-am"
region     = "us-central1"
location   = "us-central1-a"

#service_account
#sa_airflow = "airflow-sa-am2"

#GKE
gke_num_nodes = 2
machine_type  = "n1-standard-1"

#CloudSQL
instance_name     = "data-bootcamp-am-a29"
database_version  = "POSTGRES_12"
instance_tier     = "db-f1-micro"
disk_space        = 10
database_name     = "db_bootcampproject-am"
db_username       = "dbuser10"
db_password       = "deb-am10"

#storage
storage_bucket_rawlayer     = "de-bootcamp-gcs-raw"
storage_bucket_staginglayer = "de-bootcamp-gcs-staging"