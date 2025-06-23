#!/bin/bash
if [ -f /var/log/jenkins/jenkins.log ]; then
  cp /var/log/jenkins/jenkins.log $LOG_FILE
  aws s3 cp $LOG_FILE s3://fullstack-cicd-bucket/logs/$LOG_FILE
else
  echo "Jenkins log file not found."
fi
