#!/bin/bash
aws cloudwatch put-metric-data --metric-name BuildDuration --namespace FlaskPipeline --value $1 --region eu-north-1