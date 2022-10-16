variable "project_name" {
  type        = string
  description = "The name of the project"
}

# variable "cluster_name" {
#   type     = string
#   nullable = false
# }

variable "sql_user_name" {
  type     = string
  nullable = false
  default  = "algoflows"
}

variable "sql_user_password" {
  type      = string
  nullable  = false
  sensitive = true
  default   = "1234567890"
}

variable "serverless_spend_limit" {
  type     = number
  nullable = false
  default  = 50
}

variable "cloud_provider" {
  type     = string
  nullable = false
  default  = "GCP"
}

variable "cloud_provider_region" {
  type     = list(any)
  nullable = false
  default  = ["europe-west1"]
}
