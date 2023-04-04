variable "vpc_id" {
  type    = string
  default = "vpc-00b09e53c6e62a994"
}

variable "subnet_ids" {
  type    = set(string)
  default = ["subnet-069a69e50bd1ebb23"]
}

variable "source_rs_service_role" {
  type    = string
  default = "arn:aws:iam::614129417617:role/service-role/AmazonRedshift-CommandsAccessRole-20220520T124333"
}

variable "target_rs_service_role" {
  type    = string
  default = "arn:aws:iam::758373647921:role/service-role/AmazonRedshift-CommandsAccessRole-20230329T105547"
}