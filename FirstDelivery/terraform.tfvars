project_id = "de-bootcamp-am"
region     = "us-central1"
location     = "us-central1-a"

#GKE
gke_num_nodes = 2
machine_type  = "n1-standard-1"

#CloudSQL
instance_name     = "data-bootcamp-am-1"
database_version  = "POSTGRES_12"
instance_tier     = "db-f1-micro"
disk_space        = 10
database_name     = "dbname-am"
db_username       = "dbuser-CloudSQL"
db_password       = "deb-am"