resource "aws_lambda_function" "function1" {
  function_name = "ec2_stopped_mail_lambda_function"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  filename      = "function1.zip"
}

resource "aws_lambda_function" "function2" {
  function_name = "ebs_backup_mail_lambda_function"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  filename      = "function2.zip"
}

resource "aws_lambda_function" "function3" {
  function_name = "function3Convert_ebs_volume-from-gp2-to-gp3_lambda_function"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  filename      = "function3.zip"
}
