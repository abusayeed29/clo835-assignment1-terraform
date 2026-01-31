resource "aws_ecr_repository" "app" {
  name                 = var.app_repo_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

resource "aws_ecr_repository" "mysql" {
  name                 = var.mysql_repo_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}
