# 📚 Online Bookstore SQL Project

This project contains a comprehensive set of SQL scripts for setting up and managing a database for an **Online Bookstore**.  
The database schema includes tables for **Books**, **Customers**, and **Orders**, along with queries designed for data retrieval and analytical tasks.

---

## 🚀 Features

- **Database & Table Creation**  
  - The `Sql Project.sql` script creates a database named `OnlineBookstore`.  
  - Three key tables: `Books`, `Customers`, and `Orders` with proper data types and primary/foreign key relationships.

- **Data Import**  
  - Uses `COPY` commands to import data from CSV files.  
  - Provides a populated dataset for testing and analysis.  

- **Basic Queries**  
  - Retrieve books by genre.  
  - Find orders within a date range.  
  - Calculate total sales amounts.  

- **Advanced Analysis**  
  - Total number of books sold per genre.  
  - Identify the most frequently ordered book.  
  - Calculate total revenue.  
  - Determine the customer who spent the most.  
  - Calculate remaining stock after fulfilling all orders.  

---

## 🛠️ Getting Started
To run this project on your local machine, you will need a **PostgreSQL environment**.

### ✅ Prerequisites
- Install PostgreSQL and set it up on your machine.  
- Ensure you have an SQL client (e.g., **pgAdmin**, **DBeaver**, or **psql** CLI).  

### ⚡ Setup Instructions
-- Create Database
CREATE DATABASE OnlineBookstore;

-- Switch to the newly created database
\c OnlineBookstore;

-- Create Books Table
```CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(150) NOT NULL,
    Genre VARCHAR(100),
    Published_Year INT,
    Price NUMERIC(10,2) NOT NULL,
    Stock INT DEFAULT 0
);
```
-- Create Customers Table
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100)
);

-- Create Orders Table
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID) ON DELETE CASCADE,
    Book_ID INT REFERENCES Books(Book_ID) ON DELETE CASCADE,
    Order_Date DATE NOT NULL DEFAULT CURRENT_DATE,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Total_Amount NUMERIC(12,2) NOT NULL
);
-- End of Script
-- ✅ Database and tables created successfully!

📊 Queries Included :-

Some of the key queries implemented:
 • Retrieve all books in the "Fiction" genre.
 • Find the most expensive book.
 • Calculate the total revenue from all orders.
 • Find the customer who spent the most.
 • Calculate the remaining stock after fulfilling all orders.

📌 Notes :-

 • Update CSV file paths in COPY commands before running the script.
 • This project is built for PostgreSQL, but queries can be adapted for other SQL databases.
 
---------------------------------------------------
-- 🙏 Thank you for using the Online Bookstore SQL Project.

