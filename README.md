# 🚀 End-to-End DevOps Project: CI/CD + Terraform + AWS + Docker + Kubernetes

## 📌 Overview
This project is part of my **45-Day DevOps Transformation Challenge**.  
It demonstrates an end-to-end DevOps pipeline including:

- Infrastructure provisioning using **Terraform**  
- Containerization using **Docker**  
- CI/CD using **GitHub Actions / Jenkins**  
- Deployment on **AWS (EC2/EKS)**  
- Monitoring with **Prometheus + Grafana**  
- Version-controlled, modular, production-style DevOps workflows  

---
# Day 1 — DevOps Transformation Challenge

### Completed:
## 🧱 Terraform Infrastructure 
- [x] Terraform project initialized  
- [x] VPC creation  
- [x] Subnets creation  
- [x] Internet Gateway 

# Day 2 — DevOps Transformation Challenge

### Completed:
## 🧱 Terraform Infrastructure
- [x] Route Tables
- [x] Associated Subnets with route table  
- [x] Security Groups

## 🐳 Docker
- [x] Selected sample application  
- [x] Dockerfile written  
- [x] Container built and tested locally

# Day 3 — DevOps Transformation Challenge

### ✔ CI Pipeline (GitHub Actions)
- Implemented a CI workflow under `.github/workflows/ci.yml`
- Automated Docker image build on every push to `main`
- Added basic workflow structure for future tests and artifact handling

### ✔ AWS ECR Integration
- Created an Amazon ECR repository for storing application container images
- Successfully authenticated and pushed the Docker image to ECR
- Prepared the image for deployment in upcoming Terraform workflows

### ✔ Terraform Infrastructure Enhancements
- Added IAM Role configuration for EC2 instance access (SSM, CloudWatch, ECR read access)
- Integrated IAM role setup into Terraform module structure
- Updated `main.tf` and supporting files accordingly

### ✔ Repository & Documentation
- Updated README and code structure to reflect new components
- Committed all Day 3 changes to GitHub

## Day 4 Progress — DevOps Transformation Challenge

✅ Key Deliverables

- Refactored Terraform codebase into reusable modules (VPC, Subnets, Route Tables, Security Groups, EC2)

- Enforced IaC hygiene using terraform fmt and terraform validate

- Implemented CI workflow in GitHub Actions to automate Terraform checks and Docker image build

- Triggered and verified workflow run via git push

- Validated local container build using Dockerfile in the repository

📁 Highlights
modules/ (VPC, subnets, route tables, SG, EC2)
.github/workflows/ci.yml
Dockerfile

🎯 Outcome

Improved scalability, reusability, and deployment readiness through modular IaC and automated CI execution.

## Day 5 — DevOps Transformation Challenge
✅ Key Deliverables

- Migrated Terraform state to remote backend using Amazon S3 with state locking via DynamoDB

- Provisioned a second Amazon EC2 instance to simulate redundancy

- Used a consistent container image stored in Amazon Elastic Container Registry

- Deployed and validated app on local Kubernetes cluster using Minikube

- Added lint/format guardrails in CI pipeline with GitHub Actions, triggered via git push

🎯 Outcome

Achieved centralized IaC state management, redundancy simulation, container validation, and CI hygiene automation for deployment-ready workloads.

# Day 6 — DevOps Transformation Challenge

## Completed
- Implemented planned Terraform infrastructure updates.
- Validated changes using `terraform init` and `terraform plan`.
- Updated repository structure and documentation.
- Pushed verified code to GitHub.

## Key Focus
- Infrastructure automation consistency
- Git workflow discipline
- Cloud resource integration

## Next Step
- Extend automation scope and integrate pipeline workflows.

Status: ✅ Progress Maintained

# DAY 7 — DevOps Transformation Challenge 
(Deployment Pipeline Integration)

## Completed
- Provisioned AWS ECR repository using Terraform.
- Integrated ECR output into deployment workflow.
- Enhanced GitHub Actions pipeline to build and push Docker images automatically.
- Configured secure AWS authentication using GitHub Secrets.
- Validated infrastructure using Terraform init and plan.
- Pushed updated pipeline configuration to GitHub.

## Focus Area
- Infrastructure-to-deployment automation
- CI/CD pipeline reliability
- Secure artifact management

## Next Step
- Integrate Kubernetes (EKS) for container orchestration.

Status: ✅ Pipeline Execution Successful


