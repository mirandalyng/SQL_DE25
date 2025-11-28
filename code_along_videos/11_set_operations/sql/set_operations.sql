----------------------------
--UNION--
----------------------------
SELECT
    *
FROM
    synthetic.sales_jan
UNION
SELECT
    *
FROM
    sales_feb;

------------------
--will not show monitor 
SELECT
    product_name,
    amount
FROM
    synthetic.sales_jan
UNION
SELECT
    product_name,
    amount
FROM
    synthetic.sales_feb;

------------------
--union all will show all (monitor)
SELECT
    product_name,
    amount
FROM
    synthetic.sales_jan
UNION ALL
SELECT
    product_name,
    amount
FROM
    synthetic.sales_feb;

----------------------------
--INTERSECT--
----------------------------
--nothin is incommon so nothing will be returned 
SELECT
    *
FROM
    synthetic.sales_jan
INTERSECT
SELECT
    *
FROM
    synthetic.sales_feb;

----------------------------
SELECT
    product_name,
    amount
FROM
    synthetic.sales_jan
INTERSECT
SELECT
    product_name,
    amount
FROM
    synthetic.sales_feb;

----------------------------
--EXCEPT--
----------------------------
SELECT
    product_name,
    amount
FROM
    synthetic.sales_jan
EXCEPT
SELECT
    product_name,
    amount
FROM
    synthetic.sales_feb;