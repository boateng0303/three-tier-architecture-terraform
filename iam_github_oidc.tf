data "aws_iam_openid_connect_provider" "github" {
  arn = "arn:aws:iam::954108257389:oidc-provider/token.actions.githubusercontent.com"
}

resource "aws_iam_role" "github_terraform_role" {
  name = "GitHubTerraformDeployRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Federated = data.aws_iam_openid_connect_provider.github.arn
      },
      Action = "sts:AssumeRoleWithWebIdentity",
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:sub" = "repo:boateng0303/three-tier-architecture-terraform:ref:refs/heads/main"
        }
      }
    }]
  })
}

resource "aws_iam_policy" "terraform_policy" {
  name = "TerraformDeployPolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:*",
          "rds:*",
          "elasticloadbalancing:*",
          "autoscaling:*",
          "s3:*",
          "cloudwatch:*",
          "logs:*"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.github_terraform_role.name
  policy_arn = aws_iam_policy.terraform_policy.arn
}
