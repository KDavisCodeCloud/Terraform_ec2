# Terraform_ec2
Terraform EC2

Goal of this repo was to demonstrate how to spin up an EC2 instance via terraform; a cloud agnostic provisioning tool. Learning Terraform because there are use cases out there where clients will have hybrid cloud envirionments, and may have data on prem, as well as in the cloud, or they may use multiple clouds, etc. This particular use case was spinning up a virtual machine in AWS (my main area of study in cloud engineering / devops).

Terraform cli installed on local machine

aws cli installed on local machine

aws access keys and secret keys installed via aws cli to connect to an ec2 instance

added resources for the provider (aws is the provider in this case)

added a sample vpc (virtual private cloud) using terraform module and made sure to connect to same region and availablity zones

executed terraform plan and apply to verify connection via aws.
