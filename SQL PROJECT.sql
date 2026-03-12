create database OnlineBookstore;

Drop table if exists Books;
create table Books(
    Book_ID	serial	primary key,
    Title varchar(100),	
    Author varchar(100),	
    Genre varchar(50),	
    Published_Year int,
    Price numeric(10, 2),	
    Stock int	
);
select*from Books;

Drop table if exists Customers;
create table Customers(
        Customer_ID	serial primary key,
        Name varchar(100),	
        Email varchar(100),	
        Phone varchar(15),	
        City varchar(50),	
        Country varchar(150)
);	
select*from Customers;

Drop table if exists Orders;
create table Orders(
        Order_ID serial primary key,		
        Customer_ID	int references Customers(Customer_ID),		
        Book_ID	int references Books(Book_ID),
        Order_Date date,		
        Quantity int,		
        Total_Amount numeric(10, 2)
);
select*from Orders;

--BASIC--

--1) Retrieve all books in the "Fiction" genre?

select * from Books 
where Genre='Fiction';

--2) Find books published after the year 1950?

select * from Books 
where Published_Year>1950;

--3) List all the customers from the Canada?

select * from Customers
where Country='Canada';

--4) Show orders placed in November 2023?

select * from Orders
where Order_Date between '2023-11-01' and '2023-11-30';

--5) Retrieve the total stock of books available?

select sum(stock) as Total_Stock from Books;

--6) Find the details of most expensive book?

select * from Books 
order by Price desc 
limit 1;

--7) Show all the customers who ordered more than 1 quantity of a book?

 select * from Orders
 where Quantity>1;

 --8) Retrieve all orders where total amount exceeds $20?
 
select * from Orders
where Total_Amount>20;

--9) List all the genre available in the Books table?

select distinct Genre from Books;

--10) Find the Book with lowest stock?

select * from Books 
order by stock asc 
limit 1;

--11) Calculate the total revenue generated from all orders?

select sum(Total_Amount) as Revenue
from orders;

--ADVANCED--

--1) Retrieve the total number of books sold for each genre?

select b.Genre,sum(o.Quantity) as Total_Books_Sold
from Orders o
Join Books b on o.book_id = b.book_id
group by b.Genre;

--2) Find the average price of books in the "Fantasy" genre?

select avg(price) as avg_price 
from Books where Genre='Fantasy';

--3) List customers who have placed at least 2 orders?

select o.customer_id, c.name, count(o.order_id) as order_count
from orders o
join customers c on o.customer_id = c.customer_id
group by o.customer_id, c.name
having count(order_id) >=2;

--4) Find the most frequently ordered book?

select o.Book_id,b.title, count(o.order_id) as ORDER_COUNT
from orders o
join books b on o.book_id=b.book_id
group by o.Book_id, b.title
order by ORDER_COUNT desc limit 1;

--5) Show the top 3 most expensive books of 'Fantasy' Genre?

select * from Books
where genre = 'Fantasy'
order by Price desc limit 3;

--6) Retrieve the total quantity of book sold by each author?

select b.author, sum(o.quantity) as TOTAL_BOOKS_SOLD
from orders o 
join books b on o.book_id = b.book_id
group by b.author;

--7) List the cities where customers who spent over $30 are located?

select distinct c.city, o.total_amount
from orders o
join customers c on o.customer_id = c.customer_id
where o.total_amount>30;

--8) Find the customer who spent the most on orders?

select c.customer_id, c.name, sum(o.total_amount) as TOTAL_SPENT
from orders o
join customers c on o.customer_id = c.customer_id
group by c.customer_id,c.name
order by TOTAL_SPENT desc limit 1;

--9) Calculate the stock remaining after fulfilling all orders?

select b.book_id, b.title, b.stock, coalesce(sum(o.quantity),0) as order_quantity,
b.stock- coalesce(sum(o.quantity),0) as remaining_quantity
from books b
left join orders o on b.book_id = o.book_id
group by b.book_id;





