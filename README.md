Cloud Native CI/CD Pipeline for Flask Application
=================================================

This project implements a cloud-native continuous integration and deployment (CI/CD) pipeline for a Python Flask application using Jenkins. It follows DevOps best practices and integrates testing, code quality analysis, Docker-based deployment, monitoring, and notifications.

Project Objectives
------------------

*   Automate build, test, and deployment of a Flask-based REST API.
*   Integrate SonarCloud for static code analysis.
*   Use Docker for containerized deployment.
*   Send logs to AWS S3 and push custom metrics to monitoring systems.
*   Notify stakeholders on success or failure via AWS SNS.

Technology Stack
----------------

*   **Application:** Python 3, Flask
*   **Version Control:** GitHub
*   **CI/CD:** Jenkins (Pipeline as Code)
*   **Code Quality:** SonarCloud
*   **Containerization:** Docker
*   **Cloud Services:** AWS S3, AWS SNS
*   **Testing:** Pytest

CI/CD Pipeline Stages
---------------------

1.  **Checkout:** Clone the source code from GitHub.
2.  **Install Dependencies:** Create and activate Python virtualenv, install requirements.
3.  **Prepare Scripts:** Ensure all auxiliary scripts are executable.
4.  **Unit Tests:** Run automated tests using Pytest.
5.  **SonarCloud:** Run static analysis using SonarScanner.
6.  **Docker Build & Run:** Build and start Flask app container.
7.  **Upload Logs:** Send log files to AWS S3.
8.  **Push Metrics:** Post metrics to external systems.
9.  **Notify:** Send deployment result via SNS.

Local Setup
-----------

\# Clone the repository
git clone https://github.com/trivediayush/cloud-native-pipeline.git
cd cloud-native-pipeline

# Create virtual environment
python3 -m venv venv
. venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run Flask app
python app.py
    

Running in Jenkins
------------------

1.  Ensure Jenkins has Docker, Python 3, and SonarScanner installed.
2.  Create required credentials:
    *   `SONAR_TOKEN`
    *   `AWS_ACCESS_KEY_ID`
    *   `AWS_SECRET_ACCESS_KEY`
3.  Configure Jenkins pipeline using the provided `Jenkinsfile`.
4.  Trigger build manually or on commit push.

Cloud Native Considerations
---------------------------

This project adheres to cloud-native principles:

*   **Microservice-oriented:** Flask REST API
*   **Stateless:** All state handled externally
*   **Containerized:** Docker build and run
*   **Observable:** Metrics and logs exported
*   **Automated:** Fully scripted CI/CD workflow

License
-------

This project is licensed under the MIT License.
