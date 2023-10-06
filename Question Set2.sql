use music_store;

-- 1. Write a query to return the email, firstname, lastname & genre of all rock music listeners.
-- Return your list ordered alphabetically starting with A.

Select distinct c.email, c.first_name, c.last_name
from customer c
join invoice i on c.customer_id=i.customer_id
join invoice_line il on i.invoice_id=il.invoice_id
where track_id in (
                select track_id from track t
                join genre g on t.genre_id=g.genre_id
                where g.name="Rock"
                )
order by c.email;

-- 2. Let's invite the artists who have written the most rock music in our dataset. Write a query that
-- returns the artist name and total track count of the top 10 rock bands.

select artist.artist_id,artist.name,count(artist.artist_id) as number_of_songs
from track 
join album on album.album_id=track.album_id
join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id=track.genre_id
where genre.name like "rock"
group by artist.artist_id,artist.name
order by number_of_songs desc
limit 10;

-- 3. Return all the track names that have a song length longer than the average song length. Return
-- the name and millisecond for each track. Order by the song length with the longest length listed
-- first.

select name,milliseconds
from track
where milliseconds>
(select avg(milliseconds) as avg_length
from track)
order by milliseconds desc;

 

