pipeline {
    agent any

    environment {
    SONAR_TOKEN = credentials('sonar-token')
  }

  stages{
    stage('Code Cloneing......') {
        steps {
            git ''
        }
    }
    stage('Code Building......') {
        steps {
            sh 'docker build -t mywebapp .'
        }
    }
    stage('Code Testing.......')
  }
}