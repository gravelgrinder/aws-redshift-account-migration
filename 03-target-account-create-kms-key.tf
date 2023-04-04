### New Account Resources
provider "aws" {
  alias   = "target-acct"
  profile = "default"
  region  = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::758373647921:role/djl-tf-assume_role"
  }
}


###############################################################################
### Create Target KMS Key and Alias
###############################################################################
resource "aws_kms_key" "target" {
  provider                = aws.target-acct
  description             = "Redshift Target Account KMS Key"
  deletion_window_in_days = 10

  policy = "${file("IAM/target-kms-policy-v2.json")}"
}

resource "aws_kms_alias" "target" {
  provider      = aws.target-acct
  name          = "alias/tf-target-key"
  target_key_id = aws_kms_key.target.key_id
}
###############################################################################