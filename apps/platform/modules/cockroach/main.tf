terraform {
  required_providers {
    cockroach = {
      source = "cockroachdb/cockroach"
    }
  }
}

# Available GCP regions: https://cloud.google.com/compute/docs/regions-zones
# Allowed [asia-southeast1, europe-west1, southamerica-east1, us-central1, us-east1, us-west2]
# Only one region is allowed per cluster resource even though the array supports multiple regions

# Seperated the cluster and database resources to allow for more flexibility in the future

resource "cockroach_cluster" "production" {
  name                   = "${var.project_name}-production"
  cloud_provider         = var.cloud_provider
  wait_for_cluster_ready = true
  create_spec = {
    serverless = {
      regions     = ["europe-west1"]
      spend_limit = 30000 #Amount in cents 30,000 = 30 USD
    }
  }
}

resource "cockroach_cluster" "development" {
  name                   = "${var.project_name}-development"
  cloud_provider         = var.cloud_provider
  wait_for_cluster_ready = true
  create_spec = {
    serverless = {
      regions     = ["europe-west1"]
      spend_limit = 1000 #Amount in cents 1000 = 10 USD
    }
  }
}

resource "cockroach_sql_user" "production" {
  name     = var.sql_user_name
  password = var.sql_user_password
  id       = cockroach_cluster.production.id
}

resource "cockroach_sql_user" "development" {
  name     = var.sql_user_name
  password = var.sql_user_password
  id       = cockroach_cluster.development.id
}
