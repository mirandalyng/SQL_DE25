CREATE SCHEMA IF NOT EXISTS staging;

/* Creating table for brands */
CREATE TABLE
    IF NOT EXISTS staging.brands AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/brands.csv')
    );

/* Creating table for categories */
CREATE TABLE
    IF NOT EXISTS staging.categories AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/categories.csv')
    );

/* Creating table for customers*/
CREATE TABLE
    IF NOT EXISTS staging.customers AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/customers.csv')
    );

/* Creating the table for order_items */
CREATE TABLE
    IF NOT EXISTS staging.orders_items AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/order_items.csv')
    );

/* Creating table for orders */
CREATE TABLE
    IF NOT EXISTS staging.orders AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/orders.csv')
    );

/* Creating table for products */
CREATE TABLE
    IF NOT EXISTS staging.products AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/products.csv')
    );

/* Creating table for staffs */
CREATE TABLE
    IF NOT EXISTS staging.staffs AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/staffs.csv')
    );

/* Creating table for stocks */
CREATE TABLE
    IF NOT EXISTS staging.stocks AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/stocks.csv')
    );

/* Creating table for stores */
CREATE TABLE
    IF NOT EXISTS staging.stores AS (
        SELECT
            *
        FROM
            read_csv_auto ('bike_data/stores.csv')
    );