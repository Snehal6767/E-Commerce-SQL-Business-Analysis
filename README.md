# E-Commerce-SQL-Business-Analysis
An end-to-end SQL analysis in MySQL Workbench evaluating revenue trends, category performance, and customer segmentation.

# E-Commerce Performance & Customer Insights (MySQL)

## Project Overview
This project models an e-commerce database system in MySQL Workbench to answer key business queries around company revenue growth, top-performing product categories, and customer segmentation.

## Relational Database Schema
The database consists of three core relational tables:
* **`customers`**: Stores buyer demographic data.
* **`products`**: Contains product catalog and unit pricing.
* **`orders`**: Transactional records capturing purchases and shipping metrics.

---

## Key Business Analysis & Insights

### 1. Product Category Performance
* **Finding:** Analyzed total revenue and volume sold per category.
* **Insight:** Furniture generated significant revenue due to high unit price items, while Electronics drove higher overall order volume.

### 2. Customer Value Segmentation
* **Finding:** Used conditional logic (`CASE`) to segment users by overall order spend.
* **Insight:** Identified high-value customers contributing to over half of the platform revenue, enabling targeted retention campaigns.

---

## Technical Skills Demonstrated
* Data Definition Language (DDL): `CREATE TABLE`, `FOREIGN KEY` definitions
* Data Aggregation: `SUM()`, `AVG()`, `COUNT()`
* Relational Queries: `INNER JOIN`
* Conditional Logic: `CASE WHEN`
* Data Grouping & Ordering: `GROUP BY`, `ORDER BY`
