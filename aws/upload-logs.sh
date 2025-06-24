#!/bin/bash
aws s3 cp /var/log/jenkins/jenkins.log s3://fullstack-cicd-bucket/ --region eu-north-1
