resource "google_dataproc_cluster" "de-bootcamp-dataproc" {
  name     = "deb-am-dataproc_cluster"
  region   = var.region
  # graceful_decommission_timeout = "120s"
  # labels = {
  #   foo = "bar"
  # }

  # cluster_config {
  #   staging_bucket = "dataproc-staging-bucket"

  #   master_config {
  #     num_instances = 1
  #     machine_type  = "e2-medium"
  #     disk_config {
  #       boot_disk_type    = "pd-ssd"
  #       boot_disk_size_gb = 30
  #     }
  #   }

    # worker_config {
    #   num_instances    = 2
    #   machine_type     = "e2-medium"
    #   min_cpu_platform = "Intel Skylake"
    #   disk_config {
    #     boot_disk_size_gb = 30
    #     num_local_ssds    = 1
    #   }
    # }

    # preemptible_worker_config {
    #   num_instances = 0
    # }


    software_config {
      image_version = "1.5-debian10"
      optional_components = [ "ANACONDA", "JUPYTER" ]
       override_properties = {
      #   "dataproc:dataproc.allow.zero.workers" = "true"
      #   "dataproc:dataproc.enable_component_gateway" = "true"
       }
    }

    # gce_cluster_config {
    #   tags = ["foo", "bar"]
    #   # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    #   service_account = google_service_account.default.email
    #   service_account_scopes = [
    #     "cloud-platform"
    #   ]
    # }

    # You can define multiple initialization_action blocks
    # initialization_action {
    #   script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh"
    #   timeout_sec = 500
    # }
  }

resource "google_dns_managed_zone" "de-bootcamp-am-vpc-dataproc" {
  proect      = var.project_id 
  name        = "de-bootcamp-am-vpc-datproc"
  description = "vpc dataproc managed zone"
  dns_name    = "dataproc.cloud.google.com"
  visibility = "private"
  networks    = 'https://www.googleapis.com/compute/v1/projects/de-bootcamp-am/global/networks/vpcnetwork-am'

  # labels = {
  #   foo = "bar"
  # }
}