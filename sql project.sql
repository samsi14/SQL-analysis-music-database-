--Q1: senior most employee based on the job title.
select * from employee
order by levels desc
limit 1

--Q2: which country have the most invoice
select billing_country, count(*)as c from invoice
group by billing_country
order by c desc

--Q3: top 3 values of total invoice
select total from invoice
order by total desc
limit 3

--Q4:which city has the best customers.
--return city name and sum of all invoice
select billing_city, sum(total)as total from invoice
group by billing_city
order by total desc

--Q5: The person who has spent the most money
select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as amount
from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by amount desc
limit 1

--Q6:return email, first name, last name and genre of all rock music
--return your ordered list alphabetically by email starting with A
select distinct email, first_name, last_name
from customer
join invoice on invoice.customer_id=customer.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in(
select track_id from track
	join genre on genre.genre_id=track.genre_id
	where genre.name='Rock'
)
order by email

--Q7: return artist name and total track count of the top 10 rock bands
select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id=track.album_id
join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id=track.genre_id
where genre.name='Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;

--Q8: return all the track names that have a song length longer than the average
--song length. return the name and milliseconds for each track. order by the song length
--with the longest song list first.
select name, milliseconds from track
where milliseconds>(
select avg(milliseconds) as avrg_track_length from track
)
order by milliseconds desc





