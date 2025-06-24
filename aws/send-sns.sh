#!/bin/bash
aws sns publish --topic-arn "arn:aws:sns:eu-north-1:381112450421:flask-pipeline-alerts" \
--message "Pipeline status: $1" --region eu-north-1
