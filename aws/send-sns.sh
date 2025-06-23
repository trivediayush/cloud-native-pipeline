#!/bin/bash
aws sns publish --topic-arn arn:aws:sns:eu-north-1:381112450421:flask-pipeline-alerts --message "Jenkins Build Status: $1" --subject "Jenkins Build"