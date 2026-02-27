-- if the database already exists, drop it and create a new one (mostly for testing)
DROP DATABASE IF EXISTS techreads_db;

-- creates the database and uses it
CREATE DATABASE techreads_db;
USE techreads_db;

-- creates the listings table with appropriate data types
CREATE TABLE listings (
    listing_id BIGINT PRIMARY KEY, -- extracted for this purpose only, for multi-platform scraping, this will be accompanied by website name
    title VARCHAR(600),
    author VARCHAR(255),
    year year,
    price DECIMAL(10,2),
    currency VARCHAR(10),
    seller_rating VARCHAR(50)
);

-- loading the data from the CSV file into the listings table
LOAD DATA LOCAL INFILE 'C:/Users/bakht/Desktop/DE/Code/Task2_csvToSQL/techreads_books.csv'
INTO TABLE listings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- the dummy column is used to ignore the first column in the CSV file, which is just a count and not needed in the database
(@dummy, listing_id, title, author, year, price, currency, seller_rating);

-- query to select the title, price, and seller rating of the listings, ordered by price in descending order
SELECT title, price, seller_rating
FROM listings
ORDER BY price DESC;

-- this needs to be in python code
-- sql needs to be run automatically from python, so we will use the mysql.connector library to connect to the database and execute the SQL commands.........
-- techreads wants automated not manual
