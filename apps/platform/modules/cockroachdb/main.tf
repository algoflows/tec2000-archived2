# terraform {
#   required_providers {
#     cockroachdb = {
#       source = "aybabtme/cockroach"
#     }
#   }
# }

# resource "cockroach_cluster" "cluster" {
#   name             = "tec2000"
#   cluster_provider = "gcp"
#   serverless {
#     region      = "europe-west1"
#     spend_limit = 100
#   }
# }
