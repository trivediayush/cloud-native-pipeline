pipeline {
    agent any

    tools {
        maven 'Maven 3'
        jdk 'Java 11'
    }

    stages {
        stage('Checkout') {
            steps {
                git url:'https://github.com/trivediayush/jenkins-declarative-cicd-pipeline.git'
            }
        }

        stage('Build') {
            withEnv(['PATH+JAVA=${JAVA_HOME}/bin']) {
            steps {
                sh 'mvn clean compile'
            }
        }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            environment {
                SONAR_TOKEN = credentials('sonar-token')
            }
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Deploy to Surge') {
            steps {
                sh '''
                npm install -g surge
                mkdir -p dist
                echo "<h1>CI/CD Deploy Success</h1>" > dist/index.html
                surge ./dist https://jenkins-java-demo.surge.sh --token $SURGE_TOKEN
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            mail to: 'ayushtrivedi890@gmail.com',
                 subject: "SUCCESS: Jenkins Pipeline",
                 body: "Build succeeded!"
        }
        failure {
            mail to: 'ayushtrivedi890@gmail.com',
                 subject: "FAILURE: Jenkins Pipeline",
                 body: "Build failed!"
        }
    }
}
