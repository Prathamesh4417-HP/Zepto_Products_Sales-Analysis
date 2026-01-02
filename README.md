# 🛒 Zepto Products Sales Data Analysis | PostgreSQL

A SQL-driven data analytics project focused on analyzing **Zepto product sales data** using **PostgreSQL**.  
This project demonstrates how structured SQL queries can be used to uncover insights related to product pricing, discounts, stock availability, and sales performance in a quick-commerce (Q-commerce) environment.

---

## 📌 Project Overview

The **Zepto Products Sales Data Analysis** project simulates a real-world retail dataset from a fast-delivery grocery platform.  
The objective is to analyze product-level data to support business decisions such as pricing optimization, inventory planning, and demand analysis.

This project is suitable for:
- 📊 Data Analyst & Business Analyst portfolios  
- 🧠 SQL & PostgreSQL practice  
- 🏪 Retail / E-commerce analytics use cases  

---

## 🛠️ Tech Stack

- 🐘 **PostgreSQL** – Relational database
- 🧩 **pgAdmin 4** – Query execution and data exploration
- 🧠 **SQL** – Aggregations, filtering, sorting, and analytical logic
- 📁 **CSV** – Source data format

---

## 🗂️ Dataset Description

The dataset contains detailed product-level information, including:

- **sku_id** – Unique product identifier  
- **category** – Product category (e.g., Munchies, Cooking Essentials)  
- **name** – Product name  
- **mrp** – Maximum Retail Price  
- **discountPercent** – Discount applied on MRP  
- **discountedSellingPrice** – Final selling price  
- **availableQuantity** – Stock available  
- **quantity** – Units sold  
- **weightInGms** – Product weight  
- **outOfStock** – Stock availability status  

---

## 🎯 Business Questions Addressed

- Which products have the **highest discounts**?
- How does **discount percentage impact selling price**?
- Which categories dominate the product list?
- What products are at risk of **stock-out**?
- Which items have **high weight but low sales**?
- How many total products exist in the catalog?

---

## 🖼️ Project Snapshot

![Zepto Products Sales Data Analysis](https://github.com/Prathamesh4417-HP/Zepto_Products_Sales-Analysis/blob/master/Zepto-Snapshot.png)

> Snapshot showing SQL queries executed in pgAdmin to analyze Zepto product pricing, discounts, stock availability, and sales insights.


---
## 📈 Key SQL Analyses

### 🔹 Total Number of Products
```sql
SELECT COUNT(*) AS total_products
FROM zepto;
