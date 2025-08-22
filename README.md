# 📚 Online Bookstore SQL Project

Project Title: Online Bookstore Analysis<br>
Level: Beginner<br>
Database: `onlinebookstore`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze online bookstore data. The project involves setting up a bookstore database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

# Objectives

1.**Data Cleaning**: Identify and manage missing or incorrect values in the dataset.<br>
2.**Exploratory Data Analysis (EDA)**: Perform exploratory queries to understand books, customers, and orders.<br>
3.**Business Anaysis**: Use SQL to answer business-driven questions like sales trends, best-selling books, and customer insights.

# Project Structure

***1. Database Setup***
Database Creation: Create a database named onlinebookstore.
```sql
-- create database
create database onlinebookstore;

-- switch to the database
\c onlinebookstore;
```
Table Creation: Create three tables:
Books: Stores book details such as title, author, genre, published year, price, and stock.
```sql
-- create tables
drop table if exists books;
create table books (
    book_id serial primary key,
    title varchar(100),
    author varchar(100),
    genre varchar(50),
    published_year int,
    price numeric(10, 2),
    stock int
);
```
Customers: Contains customer details such as name, email, phone, city, and country.


Orders: Records customer purchases including order date, quantity, and total amount.

2. Data Exploration & Cleaning

Record Count: Count total books, customers, and orders.

Distinct Values: Identify unique genres in the books dataset.

Null Value Check: Check for missing values in books, customers, and orders.

3. Data Analysis & Findings

Customer Demographics: Analyze customers by country and city (e.g., Canadian customers).

Sales Trends: Find revenue trends, most frequently ordered books, and total sales per genre.

Book Insights: Identify the most expensive/cheapest books, stock levels, and best-selling genres.

Customer Insights: Identify loyal customers (multiple orders) and top spenders.

Findings

Customer Demographics: Customers come from different regions, including Canada, contributing to diverse sales patterns.

Sales Trends: Orders peak during certain months (e.g., November 2023). Some genres like Fantasy and Fiction perform strongly.

High-Value Orders: Several orders exceeded $20, showing premium purchases.

Stock Insights: Some books have very low stock, highlighting inventory risks.

Reports

Sales Summary: Total revenue, stock availability, and genre distribution.

Trend Analysis: Insights into sales by month and most frequently ordered books.

Customer Insights: Top customers by spending and cities with the highest sales.

How to Use

Clone the Repository: Download or clone the repository from GitHub.

Set Up the Database: Run the online_bookstore_setup.sql script to create and populate the database.

Run the Queries: Use the analysis_queries.sql file to perform analysis.

Explore and Modify: Modify queries to explore additional business questions or adapt the project to new datasets.
















