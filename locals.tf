locals {
  env_id        = "${var.customer_name}-${var.project_name}-${var.environment}"
  region_env_id = "${data.aws_region.current.name}-${local.env_id}"
}
