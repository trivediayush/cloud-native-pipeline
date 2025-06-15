Declarative Jenkins CI/CD with SonarQube and Terraform on AWS
=============================================================

📌 Project Overview
-------------------

This project demonstrates a complete CI/CD pipeline for a web application using Jenkins (Declarative Pipeline), SonarQube (code quality), Docker (containerization), Git (version control), and Terraform (Infrastructure as Code) on AWS EC2 — all configured for free-tier usage and suitable for low-resource machines. Kubernetes is intentionally excluded for efficiency.

🎯 Key Features
---------------

*   Declarative Jenkins pipeline (multistage)
*   SonarQube integration for static code analysis
*   Dockerized web app (NGINX-based)
*   Terraform-managed EC2 provisioning (IaC)
*   Secrets managed securely via Jenkins Credentials
*   Lightweight and optimized for AWS Free Tier (t2.micro)


⚙️ Tools Used
-------------

*   **Jenkins** - CI/CD server
*   **SonarQube** - Code quality scanner
*   **Terraform** - Infrastructure provisioning
*   **Docker** - Containerization
*   **AWS EC2** - Cloud compute resource
*   **Git** - Source control

🔐 Jenkins Secrets Required
---------------------------

*   `sonar-token` – SonarQube authentication token
*   `aws-access-key` – AWS access key for Terraform
*   `aws-secret-key` – AWS secret key for Terraform

🚀 Setup Instructions
---------------------

1.  Launch an Ubuntu EC2 (t2.micro) with 8 GB volume. Open ports: 22, 8080, 9000, 80.
2.  SSH into EC2 and install: Java, Docker, Jenkins, SonarQube, Git, Terraform, SonarScanner.
3.  Clone this repo or copy the folder structure as shown.
4.  Run Jenkins and SonarQube. Access them via `http://<EC2-IP>:8080` and `:9000`.
5.  Generate a token from SonarQube and create the three Jenkins credentials listed above.
6.  In Jenkins, create a new Pipeline project, use “Pipeline script from SCM”, point to this repo.
7.  Trigger the pipeline. Jenkins will:
    *   Clone code
    *   Build Docker image
    *   Scan code with SonarQube
    *   Provision EC2 via Terraform

📈 Output
---------

*   Jenkins pipeline execution view (in GUI)
*   SonarQube dashboard with code quality metrics
*   A new EC2 instance provisioned by Terraform
*   Deployed static web page hosted via Dockerized NGINX

🧹 Cleanup
----------

To remove provisioned infrastructure:

    cd terraform
    terraform destroy -auto-approve
    
📄 License
----------

This project is licensed under the MIT License.

📝 Author
----------
# Ayush Trivedi