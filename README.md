
# ☁️ Cloud Todo App – Flask + PostgreSQL on AWS with Terraform

A fully deployed cloud-native To-Do list application built with **Flask** and **PostgreSQL**, hosted entirely on **AWS** and provisioned using **Terraform**.  
This project was designed to simulate a real-world DevOps deployment with clean infrastructure-as-code and environment separation.

---
## 🗂️ Table of Contents

- [📍 Project Overview](#-overview)
- [📐 Architecture Diagram](#-architecture-diagram)
- [🧱 Tech Stack](#-tech-stack)
- [📁 Project Structure](#-project-structure)
- [🚀 How to Deploy](#-how-to-deploy)
- [🔐 Security Design](#-security-design)
- [🧠 What I Learned](#-what-i-learned)
- [🛠️ Future Improvements](#-future-improvements)
- [📬 Contact](#-contact)

---

## ✅ DevOps Progress Roadmap

> 🛠️ This project is continuously evolving as part of my DevOps learning journey.

- [x] Terraform: VPC, Subnets, Route Tables  
- [x] EC2 Instance with Flask App  
- [x] RDS PostgreSQL in Private Subnet  
- [x] Dockerize Flask + PostgreSQL (local dev)  
- [ ] `.env` secrets management (coming soon)  
- [ ] CI/CD with GitHub Actions (planned)  
- [ ] Monitoring with AWS CloudWatch  
- [ ] Domain + SSL via Route53 + ACM  
- [ ] Modularize Terraform into reusable modules  
- [ ] Deploy Docker containers to ECS or EKS


## 🔍 Overview

This project demonstrates:

- ✅ Infrastructure provisioning using **Terraform**
- ✅ Application deployment on **EC2**
- ✅ Backend PostgreSQL database hosted on **Amazon RDS** in a **private subnet**
- ✅ Secure communication between app and DB via **Security Groups**
- ✅ **Public web access** to a lightweight Flask app
- ✅ Use of **VPC, Subnets, Route Tables, IGW**, and more — fully defined as code

---

## 📐 Architecture Diagram


The infrastructure is designed to mimic production-grade isolation:
- Public subnet: only the EC2 is reachable from the Internet
- Private subnet: the RDS instance is only reachable from the EC2 (restricted via SG)
- Separate Terraform projects: one for **network infrastructure**, one for **application layer**

---

## 🧱 Tech Stack

| Layer           | Technology     |
|------------------|----------------|
| Frontend/API     | Flask (Python) |
| Backend Database | PostgreSQL (AWS RDS) |
| Provisioning     | Terraform      |
| Cloud Provider   | AWS (EC2, RDS, VPC, SG, etc.) |
| OS (EC2)         | Ubuntu 22.04   |

---

## 📁 Project Structure

```bash
cloud-todo-app/
├── app-web/              # Application Layer (EC2 + RDS)
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── outputs.tf
│   └── todo_app.py       # Flask application
│
├── infra-vpc/            # Network Layer (VPC, subnets, routing)
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── .gitignore            # Terraform & Python exclusions
└── README.md             # This file
```

## 🚀 How to Deploy

> ⚠️ You need an AWS account and valid credentials (via environment variables or AWS CLI).

### 1. Deploy the infrastructure (VPC, Subnets, IGW…)

```bash
cd infra-vpc/
terraform init
terraform apply
```

You’ll get outputs like `vpc_id`, `subnet_id`, etc.

---

### 2. Deploy the app (EC2 + RDS + Flask)

Update `app-web/terraform.tfvars` with the outputs from step 1:

```hcl
vpc_id              = "vpc-xxxxxxxx"
public_subnet_id    = "subnet-xxxxxxxx"
private_subnet_id   = "subnet-yyyyyyyy"
private_subnet_id_2 = "subnet-zzzzzzzz"
```

Then:

```bash
cd ../app-web/
terraform init
terraform apply
```

This will:

- Launch an EC2 instance (Flask app)
- Create a PostgreSQL RDS instance
- Link both using Security Groups

---

### 3. Access the App

Visit the public IP output from Terraform:

```
http://<EC2_PUBLIC_IP>
```

You’ll see a basic web app to add and remove tasks, backed by PostgreSQL.

---

## 🔐 Security Design

- The EC2 is in a **public subnet**, accessible on port **80 (HTTP)** and **22 (SSH)**
- The RDS is in a **private subnet**, accessible only via port **5432** from the EC2's security group
- The DB is **not publicly accessible**
- Keys are generated automatically via Terraform and **excluded from Git** (`.gitignore`)

---

## 🧠 What I Learned

- How to structure **modular Terraform projects**
- How to isolate environments using **public/private subnets**
- How to secure communication between components using **Security Groups**
- How to **automate full-stack cloud deployment** (network + app)
- How to think like a DevOps engineer when deploying apps to production environments

---

## 🛠️ Future Improvements

- Dockerize the Flask app
- Add CI/CD pipeline (GitHub Actions or Jenkins)
- Use Terraform modules to improve reusability
- Add Route53 + SSL for production-grade access
- Add monitoring via CloudWatch
- Integrate secrets management (e.g., AWS Secrets Manager)

---

## 📬 Contact

Made with 💻 by **Mohamed-Rédha Bouras**  
Connect on [LinkedIn](https://www.linkedin.com/) – open to opportunities and collaborations.
