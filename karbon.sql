-- a. Find the top 5 customers by total spend in the last 30 days.
SELECT u.user_id, u.username, u.email, r.total_spend
FROM (
    SELECT user_id, SUM(total_amount) AS total_spend
    FROM orders
    WHERE order_date >= CURDATE() - INTERVAL 30 DAY
    GROUP BY user_id
) r
JOIN users u ON r.user_id = u.user_id
ORDER BY r.total_spend DESC
LIMIT 5;

-- b. Find Most purchased product till date.
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 1;
