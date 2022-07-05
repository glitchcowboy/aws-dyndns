#!/bin/sh
# This is only to be used with the containerized implementation

mkdir ~/.aws

echo "[profile ddns]
region = us-east-1
output = json
" > ~/.aws/config

echo "[ddns]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
" >> ~/.aws/credentials

chmod 600 .aws/*
watch -n $TTL "date;python3 ./dns_update.py --domain $DOMAIN --zone $ZONE --ttl $TTL"
