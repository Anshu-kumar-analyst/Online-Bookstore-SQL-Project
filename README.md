# 📚 Online Bookstore SQL Project

Project Title: Online Bookstore Analysis<br>
Level: Beginner<br>
Database: `onlinebookstore`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze online bookstore data. The project involves setting up a bookstore database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

# Objectives

1. **Data Cleaning**: Identify and manage missing or incorrect values in the dataset.<br>
2. **Exploratory Data Analysis (EDA)**: Perform exploratory queries to understand books, customers, and orders.<br>
3. **Business Anaysis**: Use SQL to answer business-driven questions like sales trends, best-selling books, and customer insights.

# Project Structure

***1. Database Setup***<br>
***Database Creation:*** Create a database named onlinebookstore.<br>
```sql
-- create database
create database onlinebookstore;

-- switch to the database
\c onlinebookstore;
```
***2. Table Creation: Create three tables:***<br>
***Books:*** Stores book details such as title, author, genre, published year, price, and stock.<br>
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
***Customers:*** Contains customer details such as name, email, phone, city, and country.<br>
```sql
drop table if exists customers;
create table customers (
    customer_id serial primary key,
    name varchar(100),
    email varchar(100),
    phone varchar(15),
    city varchar(50),
    country varchar(150)
);
```
***Orders:*** Records customer purchases including order date, quantity, and total amount.
```sql
drop table if exists orders;
create table orders (
    order_id serial primary key,
    customer_id int references customers(customer_id),
    book_id int references books(book_id),
    order_date date,
    quantity int,
    total_amount numeric(10, 2)

select * from books;
select * from customers;
select * from orders;

);
```
# 2. Data Exploration & Cleaning<br>

1. ***Record Count:*** Count total books, customers, and orders.<br>
2. ***Distinct Values:*** Identify unique genres in the books dataset.<br>
3. ***Null Value Check:*** Check for missing values in books, customers, and orders.<br>

# 3. Data Analysis & Findings<br>
   
The following SQL queries were developed to answer specific business questions:<br>

1) ***Retrieve all books in the "fiction" genre:***<br>
```sql   
select * from books
where genre = 'fiction';
```
2) ***Find books published after the year 1950:***<br>
```sql    
select * from books
 where published_year > 1950;
```
3) ***List all customers from the canada:***<br>
```sql    
select * from customers
where country = 'canada';
```
4) ***How orders placed in november 2023:***<br>
```sql    
select * from orders
where order_date between '2023-11-01' and '2023-11-30';
```
5) *** Retrieve the total stock of books available:***
```sql    
select sum(stock) as total_stocks
from books;
```
6) ***Find the details of the most expensive book:***
```sql    
select * from books
order by price desc limit 1;
```
7) ***Show all customers who ordered more than 1 quantity of a book:***
```sql    
select * from orders
where quantity > 1; 
```
8) ***Retrieve all orders where the total amount exceeds $20:***
```sql    
select * from orders
where total_amount > 20;
```
9) ***List all genres available in the books table:***
```sql     
select distinct genre from books;
```
10) ***Find the book with the lowest stock:***
```sql     
select * from books
order by stock limit 10;
```
11) ***Calculate the total revenue generated from all orders:***
```sql     
select sum(total_amount) as total_revenue
from orders;
```
12) ***Retrieve the total number of books sold for each genre:***
```sql     
select b.genre , sum(o.quantity) as total_books_sold
from orders o
join books b on c.book_id = b.book_id
group by b.genre;
```

13) ***Find the average price of books in the "fantasy" genre:***
```sql     
select avg(price) as avg_price
from books
where genre = 'fantasy';
```
14) ***List customers who have placed at least 2 orders:***
```sql     
select o.customer_id, c.name, count(o.order_id) as order_count
from orders o
join customers c on c.customer_id = o.customer_id
group by o.customer_id, c.name
having count(order_id) >= 2;
```
15) ***Find the most frequently ordered book:***
```sql     
select o.book_id,b.title, count(o.order_id) as orderd_books
from orders o
join books b on b.book_id = o.book_id
group by o.book_id, b.title
order by orderd_books
desc
limit 1;
```
16) ***Show the top 3 most expensive books of 'fantasy' genre:***
```sql     
select *
from books
where genre = 'fantasy'
order by price
desc
limit 1;
```

17) ***Retrieve the total quantity of books sold by each author:***
```sql     
select distinct b.author, sum(o.quantity)
from orders o
join books b on b.book_id = o.book_id
group by b.author,o.quantity
order by sum(o.quantity)
desc;
```
18) ***List the cities where customers who spent over $30 are located:***
```sql     
select distinct(c.city), o.total_amount, c.name
from customers c
join orders o on c.customer_id = o.customer_id
group by c.city, o.total_amount, c.name
--order by o.total_amount
having o.total_amount > 30;
```
19) ***Find the customer who spent the most on orders:***
```sql 
select distinct o.customer_id, c.name, sum(o.total_amount) as most_spend
from orders o
join customers c on o.customer_id = c.customer_id
group by o.customer_id,c.name
order by most_spend
desc
limit 1;
```
20) ***Calculate the stock remaining after fulfilling all orders:***
```sql 
select b.book_id, b.title, b.stock, coalesce(sum(o.quantity),0) as total_quantity,
b.stock - coalesce(sum(o.quantity),0) as remaining_quantity
from books b
left join orders o on b.book_id = o.book_id
group by b.book_id
order by b.book_id;
```

# Findings

1. ***Customer Demographics:*** Customers come from different regions, including Canada, contributing to diverse sales patterns.<br>
2. ***Sales Trends:*** Orders peak during certain months (e.g., November 2023). Some genres like Fantasy and Fiction perform strongly.<br>
3. ***High-Value Orders:*** Several orders exceeded $20, showing premium purchases.<br>
4. ***Stock Insights:*** Some books have very low stock, highlighting inventory risks.<br>

# Reports

1.***Sales Summary:*** Total revenue, stock availability, and genre distribution.<br>
2.***Trend Analysis:*** Insights into sales by month and most frequently ordered books.<br>
3.***Customer Insights:*** Top customers by spending and cities with the highest sales.<br>

# How to Use

1. ***Clone the Repository:*** Download or clone this project from GitHub to your local system.<br>
2. ***Set Up the Database:*** Run the provided SQL script (`online_bookstore_setup.sql`) to create and populate the database.<br>
3. ***Run the Queries:*** Execute the queries from the `analysis_queries.sql` file to analyze the dataset.<br>
4. ***Explore and Modify:*** Modify the queries or add new ones to answer additional business questions.<br>

# Author - Anshu Kumar

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

# Stay Updated and Join the Community

For more content on SQL, data analysis, and other data-related topics, make sure to follow me on social media and join our community:

1. ***LinkedIn:*** [Connect with me professionally](https://www.linkedin.com/in/anshu-kumar-analysts/)<br>
2. ***Discord:*** [Join our community to learn and grow together](https://example.com)<br>
3. ***Instagram:*** [Follow me for daily tips and updates](https://www.instagram.com/me_anshu_kr/)<br>
 
***Thank you for your support, and I look forward to connecting with you!***











