module "this" {
  source = "../../"

  name             = random_string.this.result
  service_role     = module.iam-role.values.arn
  source_buildspec = file("buildspec.yml")

  tags = {
    Project = "titan"
  }
}

module "iam-role" {
  source  = "app.terraform.io/bancoripley/iam-role/aws"
  version = "0.0.11"

  name         = random_string.this.result
  aws_services = ["codebuild.amazonaws.com"]

  tags = {
    Project = "titan"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = module.iam-role.values.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}