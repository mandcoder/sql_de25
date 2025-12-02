INSTALL sqlite;
LOAD sqlite;
-- 1. Attach SQLite-databasen (skapar virtuella vyer)
ATTACH 'data/sqlite-sakila.db' AS sqlite_db;
-- 2. Skapa ett schema för riktiga DuckDB-tabeller
CREATE SCHEMA IF NOT EXISTS staging;
-- 3. Kopiera varje SQLite-tabell till en fysisk DuckDB-tabell
CREATE TABLE staging.actor AS
SELECT *
FROM sqlite_db.actor;
CREATE TABLE staging.address AS
SELECT *
FROM sqlite_db.address;
CREATE TABLE staging.category AS
SELECT *
FROM sqlite_db.category;
CREATE TABLE staging.city AS
SELECT *
FROM sqlite_db.city;
CREATE TABLE staging.country AS
SELECT *
FROM sqlite_db.country;
CREATE TABLE staging.customer AS
SELECT *
FROM sqlite_db.customer;
CREATE TABLE staging.film AS
SELECT *
FROM sqlite_db.film;
CREATE TABLE staging.film_actor AS
SELECT *
FROM sqlite_db.film_actor;
CREATE TABLE staging.film_category AS
SELECT *
FROM sqlite_db.film_category;
CREATE TABLE staging.film_list AS
SELECT *
FROM sqlite_db.film_list;
CREATE TABLE staging.film_text AS
SELECT *
FROM sqlite_db.film_text;
CREATE TABLE staging.inventory AS
SELECT *
FROM sqlite_db.inventory;
CREATE TABLE staging.language AS
SELECT *
FROM sqlite_db.language;
CREATE TABLE staging.payment AS
SELECT *
FROM sqlite_db.payment;
CREATE TABLE staging.rental AS
SELECT *
FROM sqlite_db.rental;
CREATE TABLE staging.staff AS
SELECT *
FROM sqlite_db.staff;
CREATE TABLE staging.staff_list AS
SELECT *
FROM sqlite_db.staff_list;
CREATE TABLE staging.store AS
SELECT *
FROM sqlite_db.store;
-- 4. När allt är kopierat – detach SQLite
DETACH sqlite_db;