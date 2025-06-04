Declarative Jenkins CI/CD Pipeline for Java App
===============================================

This project demonstrates a complete end-to-end CI/CD pipeline using Jenkins Declarative Pipelines for a Java application. The pipeline is configured to automatically build, test, perform code quality analysis via SonarQube, and deploy the static web output to [Surge.sh](https://surge.sh).

🛠️ Tech Stack Used
-------------------

*   Jenkins (Declarative Pipeline)
*   Java 11
*   Maven
*   JUnit
*   SonarQube (code analysis)
*   Surge.sh (deployment)
*   GitHub (source repository)
*   Amazon EC2 (Jenkins server)

📌 Features
-----------

*   Multi-stage declarative Jenkins pipeline
*   Automated build with Maven
*   JUnit test execution
*   SonarQube static code analysis
*   One-click deployment to Surge

📷 Pipeline Architecture
------------------------

<img src="/ci_cd_pipeline_diagram.png">

🚀 How to Run
-------------

1.  Clone the repository.
2.  Set up Jenkins on EC2 and configure Maven, Java, and SonarQube tools.
3.  Install required plugins: Git, Maven Integration, SonarQube Scanner, Surge Deployer (via shell).
4.  Configure SonarQube server in Jenkins global tools.
5.  Set up credentials and install Surge CLI.
6.  Run the pipeline from Jenkins UI.

📬 Author
---------

# | Ayush Trivedi |

🔗 Repository
-------------

[https://github.com/trivediayush/jenkins-declarative-cicd-pipeline](https://github.com/trivediayush/jenkins-declarative-cicd-pipeline)