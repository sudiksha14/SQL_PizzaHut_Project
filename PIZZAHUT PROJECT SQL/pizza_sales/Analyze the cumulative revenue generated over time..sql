-- Analyze the cumulative revenue generated over time.

SELECT order_date, sum(Total_sales) OVER (order by order_date) AS cum_revenue
FROM
	(SELECT orders.order_date, sum(order_details.quantity * pizzas.price) AS Total_sales
	FROM orders 
	JOIN order_details ON orders.order_id = order_details.order_id
	JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id GROUP BY orders.order_date) AS sales;