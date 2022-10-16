terraform {
  required_providers {
    cockroach = {
      source = "cockroachdb/cockroach"
    }
  }
}

// Available GCP regions: https://cloud.google.com/compute/docs/regions-zones
// Allowed [asia-southeast1, europe-west1, southamerica-east1, us-central1, us-east1, us-west2]",

resource "cockroach_cluster" "prod" {
  name                   = "${var.project_name}-prod"
  cloud_provider         = var.cloud_provider
  wait_for_cluster_ready = true
  create_spec = {
    serverless = {
      regions     = ["europe-west1", "us-central1", "us-east1", "us-west2", "asia-southeast1", "southamerica-east1"]
      spend_limit = 1000 #10 USD
    }
  }
}

resource "cockroach_cluster" "dev" {
  name                   = "${var.project_name}-dev"
  cloud_provider         = var.cloud_provider
  wait_for_cluster_ready = true
  create_spec = {
    serverless = {
      regions     = ["europe-west1"]
      spend_limit = 1000 #10 USD
    }
  }
}

resource "cockroach_sql_user" "prod" {
  name     = var.sql_user_name
  password = var.sql_user_password
  id       = cockroach_cluster.prod.id
}

resource "cockroach_sql_user" "dev" {
  name     = var.sql_user_name
  password = var.sql_user_password
  id       = cockroach_cluster.dev.id
}
