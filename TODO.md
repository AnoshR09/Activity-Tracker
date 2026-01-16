# TODO — DevOps Transformation Project

This document tracks the current state of the project to maintain clarity, execution focus, and controlled progress.

---

## ✅ DONE

### Infrastructure (Terraform)
- VPC, subnets, route tables, Internet Gateway, and security groups provisioned
- EC2 instances created using reusable Terraform modules
- IAM roles configured for EC2 access
- User-data script implemented for automated EC2 configuration (Docker install + container bootstrap)
- Remote Terraform backend configured using S3 with DynamoDB state locking

### Containerization
- Sample application selected
- Dockerfile written and validated
- Container built and tested locally
- Container image pushed to Amazon ECR

### CI / Automation
- GitHub Actions workflow implemented
- CI triggered on `git push`
- Docker image build automated in pipeline
- Lint / formatting guardrails added for Terraform

### Kubernetes (Preparation)
- Local Kubernetes cluster tested (Minikube)
- `deployment.yml` created
- `service.yml` created for future Kubernetes deployments

### Documentation & Visibility
- README updated regularly with progress
- Daily execution updates posted on LinkedIn
- GitHub repository kept in sync with all changes

---

## ⚠️ BROKEN / NEEDS VERIFICATION

- EKS cluster provisioning via Terraform not yet completed
- IAM roles for EKS (cluster role and node group role) not yet validated
- CI pipeline does not yet push Docker images to ECR automatically
- Kubernetes manifests not yet tested against a managed cluster (EKS)
- No automated CD step from CI → Kubernetes deployment

---

## ⏳ PENDING

### Kubernetes & Cloud Deployment
- Provision EKS cluster using Terraform
- Configure kubeconfig and validate cluster access
- Deploy application to EKS using existing manifests
- Expose service via LoadBalancer

### CI/CD Enhancements
- Extend GitHub Actions workflow to:
  - Build and tag image using Git SHA
  - Push image to Amazon ECR
  - Deploy manifests to EKS

### Observability
- Add basic monitoring (Prometheus + Grafana)
- Validate pod and node metrics

### Career Execution
- Maintain consistent job applications (minimum 5/day)
- Continue short, corporate LinkedIn updates tied to deliverables

---

## 🎯 Immediate Focus
Complete EKS provisioning and first successful deployment to managed Kubernetes.

---
