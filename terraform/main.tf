resource "aws_lambda_function" "ec2_stopped_mail_lambda_function" {
  function_name = "ec2_stopped_mail_lambda_function"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  filename      = "ec2_stopped_mail_lambda_function.zip"
}

resource "aws_lambda_function" "ebs_backup_mail_lambda_function" {
  function_name = "ebs_backup_mail_lambda_function"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  filename      = "ebs_backup_mail_lambda_function.zip"
}

resource "aws_lambda_function" "function3" {
  function_name = "function3"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  filename      = "function3.zip"
}
