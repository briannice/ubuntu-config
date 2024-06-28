#!/bin/bash

code="$1"

if [ -z "$code" ]; then
    echo "No code provided..."
    exit 1
fi

arn_device="..."

auth_result="$(aws sts get-session-token --serial-number "$arn_device" --token-code "$code")"

AWS_ACCESS_KEY_ID="$(echo "$auth_result" | grep "AccessKeyId" | cut -f 2 -d ":" | tr -d '" ,')"
AWS_SECRET_ACCESS_KEY="$(echo "$auth_result" | grep "SecretAccessKey" | cut -f 2 -d ":" | tr -d '" ,')"
AWS_SESSION_TOKEN="$(echo "$auth_result" | grep "SessionToken" | cut -f 2 -d ":" | tr -d '" ,')"

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN
