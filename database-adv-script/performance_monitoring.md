SET profiling = 1;

SELECT * FROM bookings WHERE start_date >= '2025-01-01';

SHOW PROFILE FOR QUERY 1;
