#!/bin/bash

if [[ $1 == "create" ]]; then
    aws ec2 create-vpc-endpoint \
    --vpc-id 'vpc-41d52038' \
    --vpc-endpoint-type 'Interface' \
    --service-name 'com.amazonaws.eu-west-1.ssm' \
    --subnet-ids 'subnet-3477176e' \
    --private-dns-enabled \
    --security-group-ids 'sg-0fafe228b23cbe4ae'
fi

if [[ $1 == "delete" ]]; then
    
    aws ec2 delete-vpc-endpoints \
    --vpc-endpoint-ids "$(aws ec2 describe-vpc-endpoints --query VpcEndpoints[*].VpcEndpointId --output text)"
fi