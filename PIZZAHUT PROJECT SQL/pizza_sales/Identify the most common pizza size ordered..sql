-- Identify the most common pizza size ordered. 

SELECT 
    pizzas.size, COUNT(order_details.order_id) AS Total_Orders
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY Total_Orders DESC
LIMIT 1;