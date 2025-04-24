# sql-challenge

## Overview
This project includes SQL queries to analyze employee and department data of a fictional company, Pewlett Hackard. The company has provided six legacy CSV files that contain employee records from that era.
This will involve:

- Designing a data model (Entity Relationship Diagram)
- Engineering a SQL database and importing the CSV data
- Performing SQL-based data analysis to answer key business questions

---
## 🧠 Challenge Breakdown

### Part 1: Data Modeling

- Reviewed all six CSV files to understand the relationships between data entities.
- Designed an Entity Relationship Diagram (ERD) showing tables, primary keys, foreign keys, and relationships.
- ERD created using [QuickDBD](https://www.quickdatabasediagrams.com/) or another ERD tool.

### Part 2: Data Engineering

- Created a **PostgreSQL schema** with appropriate tables for the CSV files.
- Defined data types, primary keys, foreign keys, and constraints for each table.
- Created tables in the correct order to satisfy foreign key dependencies.
- Imported data from CSV files using SQL commands.

Tables created:
- `departments`
- `titles`
- `employees`
- `salaries`
- `dept_emp`
- `dept_manager`

### Part 3: Data Analysis

- Wrote and executed SQL queries to answer key questions about employee data, including:
  - How many employees were hired in each decade?
  - What were the most common job titles?
  - Which employees were in specific departments during the 80s and 90s?

---

## 🛠️ Technologies Used

- PostgreSQL 17
- pgAdmin
- SQL (DDL, DML)
- QuickDBD (for ERD)

---
