# terraform.tfvars
#vpc
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"

#alb
lb_target_group_name = "medusa-tg"
aws_lb_name          = "medusa-alb"

















ecs_cluster_name = "medusa-cluster"
image_uri = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${module.ecr.repository_name}:latest"
db_url_secret_arn = "arn:aws:secretsmanager:us-east-1:123456789012:secret:db-url"
redis_url_secret_arn = "arn:aws:secretsmanager:us-east-1:123456789012:secret:redis-url"
db_username = "medusa_user"
db_password = "supersecurepassword"
