# Inventory Management System (3-Tier Architecture)

This project demonstrates a **3-tier architecture** deployed on AWS with:
- **Frontend** → Nginx serving a static HTML page
- **Backend** → Node.js + Express application
- **Database** → AWS RDS (MySQL)

The focus is on **Infrastructure as Code (Terraform)** and **Cloud & DevOps practices**, not just app code.

---

## 📂 Project Structure
```
inventory-management/
├── frontend/      # Static frontend (HTML, CSS, JS)
├── backend/       # Node.js API server
├── README.md      # Documentation
├── Inventory_Management_Documentation.docx
```

---

## 🚀 Features
- Terraform-based provisioning of VPC, EC2, and RDS
- Frontend hosted on **public EC2 with Nginx**
- Backend deployed on **private EC2 with Node.js**
- Backend connects securely to RDS in private subnet
- Proper use of **security groups** for tier-to-tier communication

---

## ⚡ Setup Instructions

### Backend
```bash
cd backend
npm install
cp .env.example .env   # update with your RDS credentials
node server.js
```

### Frontend
Open `frontend/index.html` in browser  
or serve via Nginx (public EC2).

---

## 🏗 Future Improvements
- Automate deployment using **User Data / Ansible / CI/CD**
- Add a **Load Balancer** in front of frontend
- Store DB credentials securely in **AWS Secrets Manager**

---

## 👤 Author
Created by Annikeat Jokare (Cloud & DevOps Engineer)
