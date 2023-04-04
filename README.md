# aws-redshift-account-migration
Demo stepping through migrating an Amazon Redshift cluster to another account (within the same region).  This demonstration revolves around a Snapshot and Restore procedure.  To meet the requirements listed below, it steps through a re-keying process, creating a snapshot, sharing the snapshot with another account and restoring the target cluster from the snapshot.

## Requirements
 * Source Redshift Cluster is encyrpted with KMS key.
 * Source cluster KMS key cannot be shared with the target account.

## Architecture
![alt text](https://github.com/gravelgrinder/aws-redshift-account-migration/blob/main/images/architecture-steps.png?raw=true)

## Prerequisites
1. Create KMS Key in Source Account
2. Create Source Redshift cluster, add custom data and encrypt it with the KMS key in step #1.

## Steps
3. Create KMS Key in target account and share it with the Source Account.
4. Disable Encryption from Source Cluster
5. Re-encyrpt the Source Redshift cluster with Target KMS key.
6. Take Snapshot of Source Redshift Cluster
7. Share Snapshot with Target account (758373647921).
8. In target account, restore Snapshot to Cluster.
9. Revoke access to the Source account on the Target account KMS key.


# Questions
1. What is the expense (time, money) of re-encyrpting a RS Cluster?  (Cluster sizes anywhere between 30TB and 120TB)