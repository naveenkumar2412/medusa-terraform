# main.tf
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  db_username = var.db_username
  db_password = var.db_password
}

module "redis" {
  source = "./modules/redis"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}

module "iam" {
  source = "./modules/iam"
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  cluster_name = var.ecs_cluster_name
  image_uri = var.image_uri
  alb_target_group_arn = module.alb.target_group_arn
  alb_sg_id = module.alb.sg_id
  execution_role_arn = module.iam.ecs_execution_role_arn
  task_role_arn = module.iam.ecs_task_role_arn
  db_url_secret_arn = var.db_url_secret_arn
  redis_url_secret_arn = var.redis_url_secret_arn
}
