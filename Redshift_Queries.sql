CREATE DATABASE reviews;

-- manually change database to reviews

CREATE SCHEMA data;

CREATE TABLE data.amazon_reviews_parquet(
  marketplace varchar(256), 
  customer_id varchar(256), 
  review_id varchar(256), 
  product_id varchar(256), 
  product_parent varchar(2000), 
  product_title varchar(2000), 
  star_rating int, 
  helpful_votes int, 
  total_votes int, 
  vine varchar(256), 
  verified_purchase varchar(256), 
  review_headline varchar(2000), 
  review_body varchar(50000), 
  review_date date, 
  year int,
  product_category varchar(256));
