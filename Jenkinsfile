pipeline {
  agent any
  environment {
    SONAR_TOKEN = credentials('sonar-token')
  }
  stages {
    stage('Cloning Repo.....') {
      steps {
        git 'https://github.com/your-user/jenkins-sonarqube-terraform-ci-cd.git'
      }
    }
    stage('Image Building.....') {
      steps {
        sh 'docker build -t demo-app ./app'
      }
    }
    stage('Code Quality Checking.....') {
      steps {
        sh 'sonar-scanner'
      }
    }
    stage('Terraform Init.....') {
      steps {
        dir('terraform') {
          sh 'terraform init'
        }
      }
    }
    stage('Terraform Plan.....') {
        steps {
            dir('terraform') {
                withCredentials([
                    string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
                    ]) {
                        sh 'terraform apply -auto-approve'
                    }
            }
        }
    }
    stage('Terraform Apply.....') {
      steps {
        dir('terraform') {
          withCredentials([
            string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
            string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
          ]) {
            sh 'terraform apply -auto-approve'
          }
        }
      }
    }
  }
}