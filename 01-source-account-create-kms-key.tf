### Consumer Account Resources
provider "aws" {
  alias   = "source-acct"
  profile = "default"
  region  = "us-east-1"
}

data "aws_caller_identity" "source-acct" {
  provider = aws.source-acct
}


###############################################################################
### Create Source KMS Key and Alias
###############################################################################
resource "aws_kms_key" "source" {
  provider                = aws.source-acct
  description             = "Redshift Source Account KMS Key"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "source" {
  provider      = aws.source-acct
  name          = "alias/tf-source-key"
  target_key_id = aws_kms_key.source.key_id
}
###############################################################################