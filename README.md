# 📦 Inventory Management System - Cloud Deployment

This project is a simple **Inventory Management System** used mainly to practice **Cloud and DevOps skills**.  
The goal is not coding but **deploying and managing an app on AWS** with proper infrastructure setup.

A full-stack Inventory Management System built using:
- 🖥️ Frontend: HTML, CSS, JavaScript
- ⚙️  Backend: Node.js + Express.js
- 🗄️ Database: MySQL (Amazon RDS or local)
- ☁️  Hosting: AWS EC2 (with optional NGINX reverse proxy)

---

## 🚀 Features

- Add, edit, delete inventory items
- View all items in smart table
- Export inventory as:
  - 📄 CSV
  - 📄 PDF (with formatting)
- Reset inventory
- Responsive, modern UI
- Backend REST API with:
  - `GET /inventory`
  - `POST /inventory`
  - `PUT /inventory/:id`
  - `DELETE /inventory/:id`
- `.env` for sensitive config
- Deployed using EC2 within AWS Free Tier
- Infrastructure is created through Terraform.

---

## 🎯 What I Did
- Deployed the app on **AWS EC2** (Ubuntu).
- Used **Amazon RDS (MySQL)** for database.
- Configured **NGINX** as a reverse proxy.
- Managed infrastructure with **Terraform** (VPC, EC2, RDS, Security Groups).
- Used **Linux commands** for setup and troubleshooting.
- Version controlled with **Git + GitHub**.

---

## 🏗️ Architecture
```
User → NGINX (EC2) → Node.js Backend → MySQL (RDS)
```

---

## 📁 Folder Structure

project/
│
├── index.html # Frontend (Single file)
├── server.js # Backend (Express)
├── .env # Local environment config
├── package.json # Node project config


## ⚡ Setup Instructions

### Backend
```bash
sudo apt update -y
sudo apt install -y nodejs npm
sudo apt install mysql-client-core-8.0
mkdir IM
cd IM
npm init -y
npm install express mysql2 cors dotenv bcrypt   # Install dependencies of the backend code
vim server.js                                   # In this file copy & paste the backend code
vim .env

- env file :
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=store

node server.js

```

### Frontend
```bash
sudo apt update -y
sudo apt install nginx
systemctl start nginx
systemctl enable nginx
systemctl status nginx

```
- copy the frontend code and paste it at /var/www/html/index.html

---

## RDS(Mysql)

- Setup the MySQL table:
``` bash
CREATE DATABASE store;

USE store;

CREATE TABLE inventory (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  quantity INT NOT NULL DEFAULT 0,
  price DECIMAL(10,2) DEFAULT 0.00,
  category VARCHAR(100) DEFAULT '',
  supplier VARCHAR(255) DEFAULT '',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

```
---



