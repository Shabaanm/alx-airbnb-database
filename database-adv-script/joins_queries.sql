## Select

SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;
.......................................................
## Left Join
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
    orderby.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;


........................................................

