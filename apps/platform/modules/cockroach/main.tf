terraform {
  required_providers {
    cockroach = {
      source = "cockroachdb/cockroach"
    }
  }
}

resource "cockroach_cluster" "cockroach" {
  name                   = var.project_name
  cloud_provider         = var.cloud_provider
  wait_for_cluster_ready = true
  create_spec = {
    serverless = {
      regions     = ["europe-west1"]
      spend_limit = 100
    }
  }
}

resource "cockroach_sql_user" "cockroach" {
  name     = var.sql_user_name
  password = var.sql_user_password
  id       = cockroach_cluster.cockroach.id
}
