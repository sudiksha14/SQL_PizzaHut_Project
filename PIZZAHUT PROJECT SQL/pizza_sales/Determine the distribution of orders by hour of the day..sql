-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(orders.order_time) as Time,
    COUNT(order_details.order_details_id) AS Total_Order_Placed
FROM
    Orders
        JOIN
    order_details ON orders.order_id = order_details.order_id
GROUP BY Time;