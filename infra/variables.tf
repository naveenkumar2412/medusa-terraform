# variables.tf
variable "aws_region" {
  default = "us-east-1"
}

variable "ecs_cluster_name" {}
variable "image_uri" {}
variable "db_url_secret_arn" {}
variable "redis_url_secret_arn" {}
variable "db_username" {}
variable "db_password" {}
