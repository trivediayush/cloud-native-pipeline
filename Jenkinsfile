pipeline {
  agent any
  stages {
    stage('Cloning Repo.....') {
      steps {
        git 'https://github.com/trivediayush/jenkins-declarative-cicd-pipeline.git'
      }
    }

    stage('Image Building.....') {
      steps {
        sh 'docker build -t demo-app ./app'
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
            sh '''
              terraform plan \
                -var "access_key=$AWS_ACCESS_KEY_ID" \
                -var "secret_key=$AWS_SECRET_ACCESS_KEY"
            '''
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
            sh '''
              terraform apply -auto-approve \
                -var "access_key=$AWS_ACCESS_KEY_ID" \
                -var "secret_key=$AWS_SECRET_ACCESS_KEY"
            '''
          }
        }
      }
    }
  }
}
