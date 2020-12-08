# ------------------------------------------------------------
#   CLUSTER BLOCK
# ------------------------------------------------------------

module "gke" {
  #source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"
  # Use this module because some of the features are only available in the google-beta version
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant"
  version = "~> 12.0"

  project_id = var.project_id
  name       = var.name
  region     = var.region
  zones      = var.zones
  network    = var.network
  subnetwork = var.subnetwork

  ip_range_pods                      = var.ip_range_pods
  ip_range_services                  = var.ip_range_services
  logging_service                    = var.logging_service
  monitoring_service                 = var.monitoring_service
  maintenance_start_time             = var.maintenance_start_time
  create_service_account             = var.create_service_account
  enable_resource_consumption_export = var.enable_resource_consumption_export
  skip_provisioners                  = var.skip_provisioners
  http_load_balancing                = var.http_load_balancing
  horizontal_pod_autoscaling         = var.horizontal_pod_autoscaling
  network_policy                     = var.network_policy
  enable_private_nodes               = var.enable_private_nodes
  master_ipv4_cidr_block             = var.master_ipv4_cidr_block
  remove_default_node_pool           = var.remove_default_node_pool
  enable_shielded_nodes              = var.enable_shielded_nodes
  cluster_resource_labels            = var.cluster_resource_labels
  enable_intranode_visibility        = var.enable_intranode_visibility
  authenticator_security_group       = "gke-security-groups@${var.authenticator_security_group}"
  node_pools                         = var.node_pools
  release_channel                    = var.release_channel

  node_pools_labels = var.node_pools_labels
}