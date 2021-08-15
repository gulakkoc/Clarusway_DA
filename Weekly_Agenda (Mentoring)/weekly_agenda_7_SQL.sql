

--1. Find the customers who placed at least two orders per year.**


SELECT SC.customer_id,SC.first_name,SC.last_name,YEAR(order_date) YEAR, COUNT(SO.order_id) "NUMBER OF ORDER"
FROM sales.customers SC, sales.orders SO
WHERE SC.customer_id = SO.customer_id
GROUP BY SC.customer_id,SC.first_name,SC.last_name,YEAR(order_date)
HAVING COUNT(SO.order_id) >= 2
ORDER BY customer_id


--2. Find the total amount of each order which are placed in 2018. Then categorize them according to limits stated below.(You can use case when 
--statements here)
--If the total amount of order    
    
--    less then 500 then "very low"
--    between 500 - 1000 then "low"
--    between 1000 - 5000 then "medium"
--    between 5000 - 10000 then "high"
--    more then 10000 then "very high" 

SELECT SO.order_id, 
		SUM(SOI.quantity*SOI.list_price) TOTAL_AMOUNT,

		CASE
			WHEN SUM(SOI.quantity*SOI.list_price) < 500 THEN 'very_low'
			WHEN SUM(SOI.quantity*SOI.list_price) BETWEEN 500 AND 1000 THEN 'low'
			WHEN SUM(SOI.quantity*SOI.list_price) BETWEEN 1000 AND 5000 THEN 'medium'
			WHEN SUM(SOI.quantity*SOI.list_price) BETWEEN 5000 AND 10000 THEN 'high'
			WHEN SUM(SOI.quantity*SOI.list_price) > 10000 THEN 'very high'
		END ORDER_AMOUNT
FROM sales.orders SO, sales.order_items SOI
WHERE SO.order_id = SOI.order_id  AND YEAR(SO.order_date) = 2018
GROUP BY SO.order_id
ORDER BY SO.order_id




--3. By using Exists Statement find all customers who have placed more than two orders.


SELECT SC.customer_id, SC.first_name, SC.last_name
FROM sales.customers SC
WHERE EXISTS(
SELECT  COUNT(SO.order_id) NUMBER_OF_ORDER
FROM sales.orders SO
WHERE SC.customer_id = SO.customer_id
GROUP BY SO.customer_id
HAVING COUNT(SO.order_id) >2
)



--4. Show all the products and their list price, that were sold with more than two units in a sales order.

SELECT PP.product_id, PP.list_price
FROM production.products PP
WHERE PP.product_id IN (
		SELECT product_id
		FROM sales.order_items
		WHERE quantity >= 2)
ORDER BY product_id

--SELECT PP.product_id over , pp.product_name, soi.order_id, soi.list_price
--from production.products pp, sales.order_items soi
--where pp.product_id = soi.product_id



--5. Show the total count of orders per product for all times. (Every product will be shown in one line and the total order count will be shown besides it)

SELECT PP.product_id, COUNT(DISTINCT order_id)
FROM SALES.order_items, production.products PP
GROUP BY PP.product_id

SELECT
    product_name,
    count(distinct order_id) aa
    FROM
    production.products p
LEFT JOIN sales.order_items o ON o.product_id = p.product_id
group by
product_name
ORDER BY
    aa;


	SELECT DISTINCT PRODUCT_ID
	FROM production.products
	WHERE product_id IN 

	(SELECT product_id, COUNT(DISTINCT order_id)
	FROM SALES.order_items
	GROUP BY PRODUCT_ID )

--6. Find the products whose list prices are more than the average list price of products of all brands

SELECT PP.product_name
FROM production.products PP
WHERE PP.list_price > ALL (
						SELECT AVG(PP.LIST_PRICE)
						FROM production.products PP
						GROUP BY brand_id
						)

