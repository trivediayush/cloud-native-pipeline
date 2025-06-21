k3s-argocd-gitops
=================

This project demonstrates a GitOps workflow using **K3s**, **ArgoCD**, and **Terraform** for Kubernetes application deployment and infrastructure provisioning.

📁 Project Structure
--------------------

*   **manifests/** – Kubernetes manifests managed by ArgoCD

*   **app/** – Deployment, Service, and Kustomization
*   **base/** – Namespace definition

*   **argocd/** – ArgoCD Application manifest
*   **scripts/** – Shell scripts to automate K3s installation
*   **terraform/** – Optional infrastructure provisioning via Terraform
*   **architecture.png** – High-level pipeline diagram

⚙️ Components
-------------

*   **K3s**: Lightweight Kubernetes distribution
*   **ArgoCD**: Continuous delivery controller for Kubernetes
*   **Kustomize**: Template-free way to customize YAML configurations
*   **Terraform**: Optional tool to provision infrastructure

🚀 How to Use
-------------

1.  Run `scripts/install_k3s.sh` to install K3s
2.  Apply ArgoCD manifest from `argocd/app.yaml`
3.  ArgoCD will sync manifests from `manifests/` and deploy to the cluster
4.  Optionally use `terraform/main.tf` for infra provisioning

📷 Architecture
---------------

Refer to **architecture.png** for the GitOps workflow diagram.

📘 Notes
--------

*   Ensure Git repository access is configured in ArgoCD
*   Customize `kustomization.yaml` for environment-specific overrides