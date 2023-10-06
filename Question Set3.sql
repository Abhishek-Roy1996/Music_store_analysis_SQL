use music_store;

-- 1. Find how much amount spent by each customer on artists? Write a query to return customer name, artist name
-- and total spent.

with best_selling_artist as (
select artist.artist_id as artist_id,artist.name as artist_name,
sum(invoice_line.unit_price*invoice_line.quantity) as total_sales
from invoice_line 
join track on track.track_id=invoice_line.track_id
join album on album.album_id=track.album_id
join artist on artist.artist_id=album.artist_id
group by artist.artist_id,artist.name
order by 3 desc
limit 1)

select c.customer_id, c.first_name,c.last_name,bsa.artist_name,
round(sum(il.unit_price*il.quantity),2) as amount_spent
from invoice i
join customer c on c.customer_id=i.customer_id
join invoice_line il on il.invoice_id=i.invoice_id
join track t on t.track_id=il.track_id
join album alb on alb.album_id=t.album_id
join best_selling_artist bsa on bsa.artist_id=alb.artist_id
group by 1,2,3,4
order by 5 desc;

-- 2. We want to find out the most popular music genre for each country. We determine the most popular genre as
-- the genre with the highest amount of purchases. Write a query that returns each country along with the top
-- genre. For countries where the maximum number of purchases is shared return all genres.alter

with cte as(
select count(invoice_line.quantity) as purchases, customer.country,genre.name,genre.genre_id,
row_number() over(partition by customer.country order by count(invoice_line.quantity) desc) as RowNo
from invoice_line
join invoice on invoice.invoice_id=invoice_line.invoice_id
join customer on customer.customer_id=invoice.customer_id
join track on track.track_id=invoice_line.track_id
join genre on genre.genre_id=track.genre_id
group by 2,3,4
order by 2 asc, 1 desc
)

select * from cte where RowNo<=1;

-- 3. Write a query that determines the customer that has spent the most on music for each country. Write a 
-- query that returns a country along with the top customer and how much they spent. For countries, where the
-- total amount spent is shared, provide all the customers who spent this amount.

with cte as(
select customer.customer_id,first_name,last_name,billing_country,round(sum(total),2) as total_spending,
row_number() over (partition by billing_country order by sum(total) desc) as RowNo
from invoice
join customer on customer.customer_id=invoice.customer_id
group by 1,2,3,4
order by 4 asc, 5 desc)

select * from cte where RowNo <=1;