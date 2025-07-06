
EXPLAIN ANALYZE
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(bookings.id) DESC) AS booking_rank
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id
GROUP BY 
    users.id,
    users.name;
