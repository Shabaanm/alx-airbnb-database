INSERT INTO users (first_name, last_name, email, password)
VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password1'),
('Bob', 'Smith', 'bob.smith@example.com', 'hashed_password2'),
('Carol', 'Williams', 'carol.williams@example.com', 'hashed_password3');

-- ------------------------
-- LOCATIONS
-- ------------------------
INSERT INTO locations (address, city, state)
VALUES
('123 Maple Street', 'Cape Town', 'Western Cape'),
('456 Oak Avenue', 'Johannesburg', 'Gauteng'),
('789 Pine Road', 'Durban', 'KwaZulu-Natal');

-- ------------------------
-- PROPERTIES
-- ------------------------
INSERT INTO properties (owner_id, name, location_id, price_per_night)
VALUES
(1, 'Cozy Cottage', 1, 450.00),
(2, 'Downtown Apartment', 2, 600.00),
(3, 'Beachfront Villa', 3, 1200.00),
(1, 'Mountain Cabin', 1, 800.00);

-- ------------------------
-- AMENITIES
-- ------------------------
INSERT INTO amenities (name)
VALUES
('WiFi'),
('Air Conditioning'),
('Swimming Pool'),
('Parking'),
('Breakfast Included');

-- ------------------------
-- PROPERTY-AMENITIES
-- ------------------------
INSERT INTO property_amenities (property_id, amenity_id)
VALUES
(1, 1), -- Cozy Cottage has WiFi
(1, 4), -- Cozy Cottage has Parking
(2, 1),
(2, 2),
(2, 4),
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 4);

-- ------------------------
-- BOOKINGS
-- ------------------------
INSERT INTO bookings (user_id, property_id, start_date, end_date)
VALUES
(2, 1, '2025-07-01', '2025-07-05'),
(3, 2, '2025-07-10', '2025-07-12'),
(1, 3, '2025-08-15', '2025-08-20'),
(3, 4, '2025-09-01', '2025-09-07');

-- ------------------------
-- REVIEWS
-- ------------------------
INSERT INTO reviews (user_id, property_id, rating, comment)
VALUES
(2, 1, 5, 'Loved the cozy atmosphere and quiet neighborhood!'),
(3, 2, 4, 'Great location but a bit noisy at night.'),
(1, 3, 5, 'Amazing beachfront property with stunning views.'),
(3, 4, 4, 'Perfect for a mountain getaway, well equipped.');
