#!/bin/bash
#########################
# Author: Kedhar
# Date: 24-May-2024
#
# Version: v1
#
#########################


set -x # debug mode

set -e # exit the script when there is an error

set -o pipefail #

echo "+++++++++ $(date) +++++++++++" >> aws_resourceTracker

echo "Get the list of AWS S3 buckets " >> aws_resourceTracker

aws s3 ls | awk -F" " '{print $3}' >> aws_resourceTracker

echo "Get the list of EC2 instances" >> aws_resourceTracker

aws ec2 describe-instances --region ap-south-1 | jq '.Reservations[].Instances[].InstanceId' >> aws_resourceTracker
# Aws we didn't configure the default region \
# while registering we need to provide region information
#
#
# jq is used for JSON PARSER
#
# yq is used for YAML PARDER
echo "Get list of IAM users" >> aws_resourceTracker

aws iam list-users >> aws_resourceTracker

echo "Get the list of AWS lambda list-functions" >> aws_resourceTracker

aws lambda list-functions --region ap-south-1 >> aws_resourceTracker
