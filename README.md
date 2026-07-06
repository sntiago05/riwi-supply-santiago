# 📦 Riwi Supply - Inventory & Purchasing Management

Riwi Supply is a sample inventory and purchasing management system developed with **PostgreSQL**, **Express.js**, and a **Vanilla JavaScript SPA**. The project demonstrates database normalization, relational modeling, SQL reporting, reusable views, REST API development, and a simple frontend for visualizing reports.

## 🚀 Technologies

- PostgreSQL
- Docker
- Express.js
- Node.js
- Vanilla JavaScript
- Vite
- TailwindCSS

## 📁 Project Structure

```text
riwi-supply/
│
├── backend/
│   ├── src/
│   │   ├── app.js
│   │   ├── server.js
│   │   ├── db.js
│   │   ├── routes.js
│   │   └── queries.js
│   ├── package.json
│   └── .env
│
├── frontend/
│   ├── src/
│   │   ├── api.js
│   │   ├── app.js
│   │   ├── main.js
│   │   ├── table.js
│   │   └── style.css
│   ├── index.html
│   ├── vite.config.js
│   └── package.json
│
├── db/
│   ├── creation.sql
│   ├── inserts.sql
│   ├── views.sql
│   └── reports.sql
│
└── README.md
```

## 🗄️ Database

The database is fully normalized up to **Third Normal Form (3NF)**.

### Main entities

- Cities
- Suppliers
- Categories
- Products
- Warehouses
- Purchases
- Purchase Details
- Inventory
- Inventory Movements

### The project also includes

- Primary Keys
- Foreign Keys
- Composite Keys
- CHECK Constraints
- UNIQUE Constraints
- ENUM Types
- SQL Views

## 📊 Available Reports

The API exposes reusable SQL reports including:

- Stock by Product
- Top Purchased Product
- Supplier Purchases
- Inventory Value by Warehouse
- Products Without Inventory Movements
- Categories with Average Price > $10,000
- Purchases by City
- Top 5 Most Expensive Products
- Low Stock Products

## 🛠️ Installation Guide

### Prerequisites

Before running the project, make sure you have installed:

- Docker Desktop / Docker Engine (Linux)
- Node.js (v20 or higher)
- npm

### 1. Extract the project

Unzip the project anywhere on your computer.

Example:

```text
C:\Projects\riwi-supply
```

or

```text
/home/user/riwi-supply
```

### 2. Start PostgreSQL with Docker

Open a terminal in the project root and create the PostgreSQL container.

```bash
docker run -d \
  --name riwi-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=riwi_supply \
  -p 5434:5432 \
  postgres:16
```

Verify the container is running:

```bash
docker ps
```

### 3. Execute the SQL scripts

Open your preferred PostgreSQL client (pgAdmin, DBeaver, DataGrip, etc.) and connect using:

| Field    | Value       |
|----------|-------------|
| Host     | localhost   |
| Port     | 5434        |
| Database | riwi_supply |
| User     | postgres    |
| Password | postgres    |

Execute the scripts in the following order:

```text
db/
│
├── creation.sql
├── inserts.sql
├── views.sql
└── reports.sql
```

### 4. Configure the Backend

Go to the backend folder:

```bash
cd backend
```

Install dependencies:

```bash
npm install
```

Create a `.env` file:

```env
DB_HOST=localhost
DB_PORT=5434
DB_NAME=riwi_supply
DB_USER=postgres
DB_PASSWORD=postgres
```

Run the server:

```bash
npm run dev
```

The API will be available at:

```text
http://localhost:3000
```

### 5. Configure the Frontend

Open another terminal:

```bash
cd frontend
```

Install dependencies:

```bash
npm install
```

Run the application:

```bash
npm run dev
```

The frontend will be available at:

```text
http://localhost:5173
```

## ✅ Project Ready

Once both servers are running, open your browser and access:

```text
http://localhost:5173
```

Select any available report from the interface to query the PostgreSQL database through the Express API.

## 🔌 API

Every report is exposed through the same endpoint:

```text
GET /reports/:reportName
```

Example:

```text
GET /reports/stock
```

### Available reports

- `stock`
- `topProduct`
- `topSupplier`
- `categorySalesgt10k`
- `productWithoutMovement`
- `inventoryValueByWarehouse`
- `suppliersAboveAverage`
- `buysByCity`
- `top5ProductsExpensive`
- `lowStock`

## 🎯 Learning Objectives

- Database Normalization (1NF, 2NF, 3NF)
- Entity Relationship Modeling
- PostgreSQL DDL & DML
- SQL Views
- SQL Reports
- REST API Design
- Express.js
- Docker
- Vanilla JavaScript SPA