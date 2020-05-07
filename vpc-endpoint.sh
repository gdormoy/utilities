#!/bin/bash

if [[ $1 == "create" ]]; then
    aws ec2 create-vpc-endpoint \
    --vpc-id 'vpc-07a109c988c008cc8' \
    --vpc-endpoint-type 'Interface' \
    --service-name 'com.amazonaws.eu-west-1.ssm' \
    --subnet-ids 'subnet-00b8b7177f91375fb' 'subnet-048a21198d774e486' 'subnet-0c58bb3015b20454e' \
    --private-dns-enabled \
    --security-group-ids 'sg-066210179d6885b04'
fi

if [[ $1 == "delete" ]]; then
    
    aws ec2 delete-vpc-endpoints \
    --vpc-endpoint-ids "$(aws ec2 describe-vpc-endpoints --query VpcEndpoints[*].VpcEndpointId --output text)"
fi