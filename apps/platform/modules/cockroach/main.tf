terraform {
  required_providers {
    cockroachdb = {
      source = "cockroachdb/cockroach"
    }
  }
}

resource "cockroach_cluster" "cockroach" {
  name                   = var.project_name
  cloud_provider         = "GCP"
  wait_for_cluster_ready = true
  create_spec = {
    serverless = {
      regions     = ["europe-west1"]
      spend_limit = 100
    }
  }
}
