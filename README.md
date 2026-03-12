# Online Book Store – SQL Project
 # Project Overview
 
The Online Book Store project is a database system designed to manage books, customers, and orders in an online bookstore environment.
This project demonstrates how relational databases can be used to store, organize, and analyze bookstore data efficiently using SQL.
The system allows users to manage book inventory, store customer details, and track book purchases.

 # Objectives

Design a relational database for an online bookstore.

Store and manage book information.

Maintain customer records.

Track orders and purchase history.

Perform data analysis using SQL queries.

# Technologies Used
Postgre SQL

CSV Datasets

Database concepts such as:

Primary Keys

Foreign Keys

Joins

Aggregate Functions

Clauses

 # Project Files
File Name	Description

SQL PROJECT.sql	Contains database creation, tables, and SQL queries

Books.csv	Dataset containing book details

Customers.csv	Dataset containing customer information

Orders.csv	Dataset containing order and purchase records

 # Database Structure

The database contains the following main tables:

1️⃣ Books
Stores information about books available in the store.
Fields may include:
Book_ID

Title

Author

Genre

Price

Stock

2️⃣ Customers
Stores customer information.

Fields may include:

Customer_ID

Name

Email

Location

3️⃣ Orders
Stores information about book purchases.

Fields may include:

Order_ID

Customer_ID

Book_ID

Order_Date

Quantity

# Relationships
A customer can place multiple orders.

Each order references a book and a customer.

Relationships are maintained using foreign keys.

# Example SQL Operations
Some of the queries performed in this project include:

Retrieve all books available in the store

Find the total number of orders

Display customer purchase history

Calculate total sales

Identify the most popular books

# Learning Outcomes
Through this project, the following concepts were practiced:

Database design

Data normalization

SQL querying

Data relationships

Data analysis using SQL

 # Author
Oraganti Chandu
