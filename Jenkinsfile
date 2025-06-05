pipeline {
    agent any

    tools {
        maven 'Maven 3'
        jdk 'Java 11'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/trivediayush/jenkins-declarative-cicd-pipeline.git'
            }
        }

        stage('Build') {
            steps {
                withEnv(["JAVA_HOME=${tool 'Java 11'}", "PATH+JAVA=${tool 'Java 11'}/bin", "PATH+MAVEN=${tool 'Maven 3'}/bin"]) 
                sh 'mvn clean compile'
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
