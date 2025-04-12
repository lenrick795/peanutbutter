resource "aws_iam_user" "main" {
  name = var.my_user_name
  path = var.my_user_path
}

output "my_user_name_output" {
  value = aws_iam_user.main.name
}