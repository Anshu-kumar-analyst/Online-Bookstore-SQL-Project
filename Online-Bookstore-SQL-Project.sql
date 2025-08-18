-- create database
create database onlinebookstore;

-- switch to the database
\c onlinebookstore;

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
drop table if exists customers;
create table customers (
    customer_id serial primary key,
    name varchar(100),
    email varchar(100),
    phone varchar(15),
    city varchar(50),
    country varchar(150)
);
drop table if exists orders;
create table orders (
    order_id serial primary key,
    customer_id int references customers(customer_id),
    book_id int references books(book_id),
    order_date date,
    quantity int,
    total_amount numeric(10, 2)
);

select * from books;
select * from customers;
select * from orders;


-- import data into books table
copy books(book_id, title, author, genre, published_year, price, stock) 
from 'f:\postgresql\all excel practice files' 
csv header;

-- import data into customers table
copy customers(customer_id, name, email, phone, city, country) 
from 'f:\postgresql\all excel practice files' 
csv header;

-- import data into orders table
copy orders(order_id, customer_id, book_id, order_date, quantity, total_amount) 
from 'f:\postgresql\all excel practice files' 
csv header;


-- 1) retrieve all books in the "fiction" genre:
select * from books
where genre = 'fiction';


-- 2) find books published after the year 1950:
select * from books
 where published_year > 1950;

-- 3) list all customers from the canada:
select * from customers
where country = 'canada';

-- 4) show orders placed in november 2023:
select * from orders
where order_date between '2023-11-01' and '2023-11-30';

-- 5) retrieve the total stock of books available:
select sum(stock) as total_stocks
from books;

select * from books;
select * from customers;
select * from orders;

-- 6) find the details of the most expensive book:
select * from books
order by price desc limit 1;

-- 7) show all customers who ordered more than 1 quantity of a book:
select * from orders
where quantity > 1; 

-- 8) retrieve all orders where the total amount exceeds $20:
select * from orders
where total_amount > 20;

-- 9) list all genres available in the books table:
select distinct genre from books;

-- 10) find the book with the lowest stock:
select * from books
order by stock limit 10;

-- 11) calculate the total revenue generated from all orders:
select sum(total_amount) as total_revenue
from orders;

-- advance questions : 

select * from books;
select * from customers;
select * from orders;

-- 1) retrieve the total number of books sold for each genre:
select b.genre , sum(o.quantity) as total_books_sold
from orders o
join books b on c.book_id = b.book_id
group by b.genre;


-- 2) find the average price of books in the "fantasy" genre:
select avg(price) as avg_price
from books
where genre = 'fantasy';

-- 3) list customers who have placed at least 2 orders:
select o.customer_id, c.name, count(o.order_id) as order_count
from orders o
join customers c on c.customer_id = o.customer_id
group by o.customer_id, c.name
having count(order_id) >= 2;


select * from books;
select * from customers;
select * from orders;


-- 4) find the most frequently ordered book:
select o.book_id,b.title, count(o.order_id) as orderd_books
from orders o
join books b on b.book_id = o.book_id
group by o.book_id, b.title
order by orderd_books
desc
limit 1;

-- 5) show the top 3 most expensive books of 'fantasy' genre :
select *
from books
where genre = 'fantasy'
order by price
desc
limit 1;


-- 6) retrieve the total quantity of books sold by each author:
select distinct b.author, sum(o.quantity)
from orders o
join books b on b.book_id = o.book_id
group by b.author,o.quantity
order by sum(o.quantity)
desc;


select * from books;
select * from customers;
select * from orders;


-- 7) list the cities where customers who spent over $30 are located:
select distinct(c.city), o.total_amount, c.name
from customers c
join orders o on c.customer_id = o.customer_id
group by c.city, o.total_amount, c.name
--order by o.total_amount
having o.total_amount > 30;

-- 8) find the customer who spent the most on orders:
select distinct o.customer_id, c.name, sum(o.total_amount) as most_spend
from orders o
join customers c on o.customer_id = c.customer_id
group by o.customer_id,c.name
order by most_spend
desc
limit 1;


select * from books;
select * from customers;
select * from orders;


--9) calculate the stock remaining after fulfilling all orders:
select b.book_id, b.title, b.stock, coalesce(sum(o.quantity),0) as total_quantity,
b.stock - coalesce(sum(o.quantity),0) as remaining_quantity
from books b
left join orders o on b.book_id = o.book_id
group by b.book_id
order by b.book_id;