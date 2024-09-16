variable "environment" {
  type        = string
  description = "The environment name"
  validation {
    condition     = contains(["sbx", "dev", "stg", "prd"], var.environment)
    error_message = "Valid values for var: environment are (sbx, dev, stg, prd)."
  }
}

variable "customer_name" {
  type        = string
  description = "Customer name (Maximum 4 characters)"
  validation {
    condition     = length(var.customer_name) <= 4
    error_message = "customer_name maximum 4 characters"
  }
}

variable "project_name" {
  type        = string
  description = "Project name (Maximum 5 characters)"
  validation {
    condition     = length(var.project_name) <= 5
    error_message = "project_name maximum 5 characters"
  }
}

variable "repository_name" {
  type        = string
  description = "Github repository name"
}

variable "aws_region" {
  type        = string
  description = "Default AWS region deploying into"

}
