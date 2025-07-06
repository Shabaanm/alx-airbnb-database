EXPLAIN
SELECT
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,

    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,

    properties.id AS property_id,
    properties.name AS property_name,
    properties.location,
    properties.price,

    payments.id AS payment_id,
    payments.amount,
    payments.status,
    payments.payment_date

FROM
    bookings
INNER JOIN
    users ON bookings.user_id = users.id
INNER JOIN
    properties ON bookings.property_id = properties.id
LEFT JOIN
    payments ON bookings.payment_id = payments.id
WHERE
    bookings.start_date >= '2024-01-01'
    AND payments.status = 'Completed';
