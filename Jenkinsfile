pipeline {
    agent any

    environment {
        S3_BUCKET = 'fullstack-cicd-bucket'
        REGION = 'eu-north-1'
        SNS_TOPIC = 'arn:aws:sns:eu-north-1:381112450421:flask-pipeline-alerts'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/trivediayush/cloud-native-pipeline.git'
            }
        }

        stage('Install Deps') {
            steps {
                dir('app') {
                    sh '''
                        python3 -m venv venv
                        . venv/bin/activate
                        pip install -r requirements.txt
                    '''
                }
            }
        }

        stage('Prepare Scripts') {
            steps {
                sh 'chmod +x aws/*.sh'
            }
        }

        stage('Unit Test') {
            steps {
                dir('tests') {
                    sh 'pytest test_main.py'
                }
            }
        }

        stage('SonarCloud') {
            steps {
                withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                    sh 'sonar-scanner -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }

        stage('Docker Build & Run') {
            steps {
                dir('app') {
                    sh 'docker build -t flask-app .'
                }
                sh 'docker run -d -p 5000:5000 flask-app'
            }
        }

        stage('Upload Logs to S3') {
            steps {
                sh './aws/upload-logs.sh'
            }
        }

        stage('Push Metrics') {
            steps {
                script {
                    def duration = currentBuild.durationString.replaceAll('[^0-9]', '')
                    if (duration == '') { duration = '1' }
                    sh "./aws/push-metrics.sh ${duration}"
                }
            }
        }

        stage('Notify') {
            steps {
                sh './aws/send-sns.sh SUCCESS'
            }
        }
    }

    post {
        failure {
            sh './aws/send-sns.sh FAILURE'
        }
    }
}
