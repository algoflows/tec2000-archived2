terraform {
  required_providers {
    cockroachdb = {
      source = "aybabtme/cockroach"
    }
  }
}

resource "cockroach_cluster" "main" {
  name             = var.project_name
  cluster_provider = "GCP"
  create_spec {
    serverless {
      region      = "europe-west1"
      spend_limit = 100
    }
  }
}
