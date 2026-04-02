# DevOps Sample Project

## Project Overview

This project demonstrates an end-to-end DevOps workflow using AWS, Terraform, GitHub Actions, and CloudWatch.

It covers the full lifecycle of a modern DevOps system including:

- Infrastructure provisioning with Terraform
- Environment separation (dev and prod)
- Continuous Integration using GitHub Actions
- Application deployment on AWS EC2
- Monitoring with AWS CloudWatch (logs, metrics, alarms)
- Deployment testing and rollback practice

This project simulates real-world DevOps scenarios such as deployment validation, failure detection, and recovery.

---

## Architecture

The system is built using the following components:

- **GitHub** – Source code management
- **GitHub Actions** – CI pipeline (lint, test, build)
- **Terraform** – Infrastructure as Code
- **AWS EC2** – Application hosting
- **AWS IAM** – Role-based access control
- **AWS S3** – Storage and backend preparation
- **AWS CloudWatch** – Monitoring and logging

---

## Architecture Diagram


Developer
|
v
GitHub Repository
|
v
GitHub Actions CI Pipeline
|
+--> Lint
+--> Test
+--> Build
|
v
Terraform Deployment
|
v
AWS Infrastructure
|
+--> EC2 Instance
| |
| +--> Apache / Sample App
|
+--> IAM Role / Instance Profile
|
+--> S3 Bucket
|
v
CloudWatch
|
+--> Logs
+--> Metrics
+--> Alarms


---

## CI/CD Pipeline Flow

### Continuous Integration (CI)

On every push or pull request:

- Checkout code
- Setup Python environment
- Install dependencies
- Run lint checks (flake8)
- Run unit tests (pytest)
- Upload artifacts

### Build Stage

- Download artifacts
- Validate build output

---

## Infrastructure Deployment

Infrastructure is provisioned using Terraform.

### Key resources:

- EC2 instance running Apache
- IAM role and instance profile
- Security group (HTTP + SSH access)
- S3 bucket
- CloudWatch alarm

---

## Environment Separation

The project uses a modular Terraform structure:


infrastructure/
modules/
ec2/
s3/
environments/
dev/
prod/


- Modules define reusable infrastructure
- Environments define configuration per environment

This enables safe and scalable deployments.

---

## Monitoring (CloudWatch)

### Logs collected

- `/var/log/messages` (system logs)
- `/var/log/httpd/access_log` (Apache access logs)
- `/var/log/httpd/error_log` (Apache error logs)

### Metrics

#### Default AWS Metrics
- CPUUtilization (AWS/EC2)

#### Custom Metrics (CloudWatch Agent)
- Memory usage
- Disk usage

Namespace used:

Aish/EC2

### Alarm

- High CPU alarm (triggers above threshold)

---

## Deployment Testing and Rollback Practice

A controlled failure simulation was performed to test system reliability.

### Scenario

- Apache service was intentionally stopped
- Application became unreachable
- Issue was detected via browser and logs

### Recovery

- Service status verified using systemctl
- Apache restarted
- Application recovered
- Logs confirmed normal traffic

This demonstrates:

- Deployment validation
- Failure detection
- Root cause analysis
- Service recovery

---

## Project Structure

DevopsSampleProject/
.github/
workflows/
python-ci.yml

infrastructure/
modules/
ec2/
s3/
environments/
dev/
prod/

tests/
test_app.py

app.py
Dockerfile
requirements.txt
README.md

---

## How to Run

### Prerequisites

- AWS account
- Terraform installed
- Python installed
- GitHub repository

---

### Run Infrastructure

```bash
cd infrastructure/environments/dev
terraform init
terraform plan
terraform apply

## Run Tests
python -m pip install -r requirements.txt
python -m pytest
python -m flake8 app.py tests --max-line-length=100