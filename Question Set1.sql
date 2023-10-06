use music_store;

-- 1. Who is the senior most employee based on job title?

select * 
from employee
order by levels desc
limit 1;

-- 2. Which countries have the most invoices?

select billing_country,count(*) as most_invoice 
from invoice
group by billing_country
order by most_invoice desc;

-- 3. What are the top 3 values of total invoice?

select total
from invoice
order by total desc
limit 3;

-- 4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we 
-- made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return
-- both the city name & sum of all invoices.

select billing_city,round(sum(total),2) as invoice_total 
from invoice
group by billing_city
order by invoice_total desc;

-- 5. Who is the best customer? The customer who has spent the most money will be declared the best customer.
-- Write a query that return the person who has spent the most money.

select c.customer_id,first_name,c.last_name, round(sum(i.total),2) as total_money_spent
from customer c inner join invoice i 
on c.customer_id=i.customer_id
group by c.first_name,c.last_name,c.customer_id
order by total_money_spent desc
limit 1;