-- Users total bookings with ROW_NUMBER() ranking
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


-- Properties total bookings with RANK()
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS booking_rank
FROM
    properties
LEFT JOIN
    bookings ON properties.id = bookings.property_id
GROUP BY
    properties.id,
    properties.name;
