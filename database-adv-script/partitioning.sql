CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    payment_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    -- other columns
) PARTITION BY RANGE (start_date);

