variable "project_name" {
  type        = string
  description = "Project name for tagging"
}

variable "repos" {
  type        = list(string)
  description = "List of ECR repository names to create"
}
