###############################################################################
### Create Target Redshift Cluster
###############################################################################
resource "aws_redshift_cluster" "target" {
  provider           = aws.target-acct
  cluster_identifier = "tf-target-redshift-cluster"
  owner_account       = "${data.aws_caller_identity.source-acct.account_id}"
  snapshot_identifier = "djl-shared-rs-snapshot"
  snapshot_cluster_identifier = aws_redshift_cluster.source.cluster_identifier
  node_type          = "dc2.large"
  cluster_type       = "single-node"
  encrypted          = true
  kms_key_id         = aws_kms_key.target.arn
  publicly_accessible = false
  iam_roles              = [var.target_rs_service_role]
  vpc_security_group_ids = ["sg-0753908c3784d7594"]
  cluster_subnet_group_name = "cluster-subnet-group-1"
  availability_zone_relocation_enabled = false
  availability_zone = "us-east-1a"
}
