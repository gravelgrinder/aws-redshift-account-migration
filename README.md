# aws-redshift-account-migration
Demo stepping through migrating an Amazon Redshift cluster to another account (within the same region).  This demonstration revolves around a Snapshot and Restore procedure.  To meet the requirements listed below, it steps through a re-keying process, creating a snapshot, sharing the snapshot with another account and restoring the target cluster from the snapshot.

## Requirements
 * Source Redshift Cluster is encyrpted with KMS key.
 * Source cluster KMS key cannot be shared with the target account.

## Architecture
![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/architecture-steps.gif?raw=true)

## Prerequisites
1. Create KMS Key in Source Account
2. Create Source Redshift cluster, add custom data and encrypt it with the KMS key in step #1. ![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/01-architecture-diagram.png?raw=true)

## Steps
3. Create KMS Key in target account and share it with the Source Account. ![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/02-architecture-diagram.png?raw=true)
4. Disable Encryption from Source Cluster ![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/03-architecture-diagram.png?raw=true)
5. Re-encyrpt the Source Redshift cluster with Target KMS key. ![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/04-architecture-diagram.png?raw=true)
6. Take Snapshot of Source Redshift Cluster ![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/05-architecture-diagram.png?raw=true)
7. Share Snapshot with Target account (758373647921). ![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/06-architecture-diagram.png?raw=true)
8. In target account, restore Snapshot to Cluster. ![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/07-architecture-diagram.png?raw=true)
9. Revoke access to the Source account on the Target account KMS key. ![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/08-architecture-diagram.png?raw=true)


## Questions
1. What is the expense (time, money) of re-encyrpting a RS Cluster?  (Cluster sizes anywhere between 30TB and 120TB)

## Alternative Migration Approaches to Consider
* UNLOAD/RELOAD Data within Cluster
  * [Documentation - Redshift Unloading Data](https://docs.aws.amazon.com/redshift/latest/dg/c_unloading_data.html)
* Account Ownership Transfer 
  * [re:Post - How to transfer my AWS account to another person or business](https://repost.aws/knowledge-center/transfer-aws-account)
  * [re:Post - How do I move accounts between organizations in AWS Organizations](https://repost.aws/knowledge-center/organizations-move-accounts)
