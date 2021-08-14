

--1. Find the customers who placed at least two orders per year.**


SELECT SC.customer_id,SC.first_name,SC.last_name,YEAR(order_date) YEAR, COUNT(SO.order_id) "NUMBER OF ORDER"
FROM sales.customers SC, sales.orders SO
WHERE SC.customer_id = SO.customer_id
GROUP BY SC.customer_id,SC.first_name,SC.last_name,YEAR(order_date)
HAVING COUNT(SO.order_id) >= 2
ORDER BY customer_id


--2. Find the total amount of each order which are placed in 2018. Then categorize them according to limits stated below.(You can use case when statements here)

--3. By using Exists Statement find all customers who have placed more than two orders.

--4. Show all the products and their list price, that were sold with more than two units in a sales order.

--5. Show the total count of orders per product for all times. (Every product will be shown in one line and the total order count will be shown besides it)

--6. Find the products whose list prices are more than the average list price of products of all brands

--7. In how many ways, a group of 3 boys and 2 girls can be formed out of a total of 5 boys and 5 girls?

--8.A woman has 6 blouses, 4 skirts, and 5 pairs of shoes. How many different outfits consisting of a blouse, a skirt, and a pair of shoes can she wear?

--9. Serena Williams won the 2010 Wimbledon Ladies� Singles Championship. For the seven matches she played in the tournament, her total number of first serves was 379, total number of good first serves was 256, and total number of double faults was 15.

--a. Find the probability that her first serve is good.

--b. Find the conditional probability of double faulting, given that her first serve resulted in a fault.

--c. On what percentage of her service points does she double fault?