

###############################################################################
### Create Source Redshift Cluster
###############################################################################
resource "aws_redshift_cluster" "source" {
  provider           = aws.source-acct
  cluster_identifier = "tf-source-redshift-cluster"
  database_name      = "djl"
  master_username    = "admin"
  master_password    = "AWSomePassword1"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
  encrypted          = true
  kms_key_id         = aws_kms_key.target.arn
  publicly_accessible = false
  iam_roles              = [var.source_rs_service_role]
  vpc_security_group_ids = ["sg-091fff29ba7c79318"]
  cluster_subnet_group_name = "djl-rs-connect-subnetgroup"
  availability_zone_relocation_enabled = false
  availability_zone = "us-east-1a"
  skip_final_snapshot = "true"
}


resource "aws_redshiftdata_statement" "source" {
  provider           = aws.source-acct
  cluster_identifier = aws_redshift_cluster.source.cluster_identifier
  database           = aws_redshift_cluster.source.database_name
  db_user            = aws_redshift_cluster.source.master_username
  sql                = file("create_data.sql")
}