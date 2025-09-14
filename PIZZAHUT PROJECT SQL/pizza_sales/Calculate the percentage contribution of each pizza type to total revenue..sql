-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    ROUND(SUM(pizzas.price * order_details.quantity) / (SELECT 
                    ROUND(SUM(pizzas.price * order_details.quantity),
                                2) AS Total_Sales
                FROM
                    pizzas
                        JOIN
                    order_details ON order_details.pizza_id = pizzas.pizza_id) * 100,
            2) AS Total_Sales_Percentage
FROM
    pizzas
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category 
order by Total_Sales_Percentage desc;