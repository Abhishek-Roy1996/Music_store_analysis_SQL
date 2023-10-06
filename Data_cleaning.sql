create database music_store;

use music_store;

create table track(
track_id int,
name varchar(100),
album_id int,	
media_type_id int,	
genre_id int,
composer varchar(50),	
milliseconds int,
bytes int,	
unit_price double);

select * from track;

create table album(
album_id int,
title varchar(100),
artist_id int);

alter table employee
add column new_birthdate date;

alter table employee
add column new_hiredate date;

UPDATE employee
SET new_birthdate = STR_TO_DATE(birthdate, "%d-%m-%Y");

UPDATE employee
SET new_hiredate = STR_TO_DATE(hire_date, "%d-%m-%Y");

ALTER TABLE employee
DROP COLUMN birthdate,
DROP COLUMN hire_date;

ALTER TABLE employee
RENAME COLUMN new_birthdate TO birthdate,
RENAME COLUMN new_hiredate TO hire_date;

select * from playlist;

ALTER TABLE invoice
ADD COLUMN new_invoice_date DATE;

UPDATE invoice
SET new_invoice_date = STR_TO_DATE(invoice_date, "%d-%m-%Y");

ALTER TABLE invoice
DROP COLUMN invoice_date;

ALTER TABLE invoice
RENAME COLUMN new_invoice_date TO invoice_date;

select * from invoice;

