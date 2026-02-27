DROP DATABASE IF EXISTS techreads_db;
CREATE DATABASE techreads_db;
USE techreads_db;

CREATE TABLE listings (
    listing_id BIGINT PRIMARY KEY,
    title VARCHAR(600),
    author VARCHAR(255),
    year INT,
    price DECIMAL(10,2),
    currency VARCHAR(10),
    seller_rating VARCHAR(50)
);

LOAD DATA LOCAL INFILE 'C:/Users/bakht/Desktop/DE/Code/Task2_csvToSQL/techreads_books.csv'
INTO TABLE listings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@dummy, listing_id, title, author, year, price, currency, seller_rating);

SELECT * FROM listings LIMIT 10;