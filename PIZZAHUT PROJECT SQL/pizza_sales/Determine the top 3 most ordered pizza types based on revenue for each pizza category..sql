-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT category, name , Revenue FROM 
(SELECT category, name , Revenue,
RANK() over (PARTITION BY category ORDER BY Revenue DESC) AS rn
FROM
(SELECT pizza_types.category, pizza_types.name,
    SUM(pizzas.price * order_details.quantity) AS Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category, pizza_types.name) AS a) AS b
WHERE rn <= 3;