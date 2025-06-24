#!/bin/bash
aws cloudwatch put-metric-data --metric-name BuildDuration --namespace "JenkinsPipeline" --value $1 --region eu-north-1
