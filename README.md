Online Bookstore SQL Project :-
This project contains a comprehensive set of SQL scripts for setting up and managing a database for an online bookstore. The database schema includes tables for books, customers, and orders, and the queries are designed to perform various data retrieval and analytical tasks.

Features :-
Database and Table Creation: The Sql Project.sql script includes commands to create a database named OnlineBookstore and three key tables: Books, Customers, and Orders, with appropriate data types and primary/foreign key relationships.

Data Import: The project uses COPY commands to import data from CSV files into the newly created tables, providing a populated dataset for analysis.

Basic Queries: Includes foundational SQL queries to retrieve data based on specific conditions, such as filtering books by genre, finding orders within a date range, and calculating totals.

• Advanced Analysis: Features more complex queries using JOIN, GROUP BY, HAVING, and aggregate functions to answer business-critical questions, such as:
• Finding the total number of books sold per genre.
• Identifying the most frequently ordered book.
• Calculating the total revenue.
• Determining which customer has spent the most.
• Calculating remaining stock after fulfilling all orders.

Getting Started :-
To run this project on your local machine, you will need a PostgreSQL environment.

Prerequisites: Ensure you have PostgreSQL installed and configured.

Create the Database: Run the initial command to create the database:
• CREATE DATABASE OnlineBookstore;
Execute the SQL Script: Open your SQL client (e.g., pgAdmin, DBeaver) and run the Sql Project.sql file.

Note on Data Paths: The COPY commands in the script use specific file paths (e.g., F:\PostgreSQL\All Excel Practice Files, D:\Course Updates\30 Day Series\SQL\CSV). You must update these paths to match the location of your CSV files on your own machine for the data import to work correctly.

Database Schema :-
The database consists of the following tables:

Books :-
Book_ID (SERIAL PRIMARY KEY)
Title (VARCHAR)
Author (VARCHAR)
Genre (VARCHAR)
Published_Year (INT)
Price (NUMERIC)
Stock (INT)

Customers :-
Customer_ID (SERIAL PRIMARY KEY)
Name (VARCHAR)
Email (VARCHAR)
Phone (VARCHAR)
City (VARCHAR)
Country (VARCHAR)

Orders :-
Order_ID (SERIAL PRIMARY KEY)
Customer_ID (INT REFERENCES Customers)
Book_ID (INT REFERENCES Books)
Order_Date (DATE)
Quantity (INT)
Total_Amount (NUMERIC)

Queries Included :-
• The script is organized with comments to separate different queries. Some of the key queries are:
• Retrieve all books in the "Fiction" genre.
• Find the most expensive book.
• Calculate the total revenue from all orders.
• Find the customer who spent the most on orders.

Calculate the remaining stock after fulfilling all orders.
