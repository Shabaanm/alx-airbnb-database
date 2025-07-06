-- ------------------------
-- USERS
-- ------------------------
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------
-- LOCATIONS
-- ------------------------
CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    address TEXT NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL
);

-- ------------------------
-- PROPERTIES
-- ------------------------
CREATE TABLE properties (
    id SERIAL PRIMARY KEY,
    owner_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    location_id INT NOT NULL REFERENCES locations(id),
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for faster search by city/state via join
CREATE INDEX idx_properties_location_id ON properties(location_id);

-- ------------------------
-- AMENITIES
-- ------------------------
CREATE TABLE amenities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- ------------------------
-- PROPERTY-AMENITY JOIN TABLE
-- ------------------------
CREATE TABLE property_amenities (
    property_id INT NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
    amenity_id INT NOT NULL REFERENCES amenities(id) ON DELETE CASCADE,
    PRIMARY KEY (property_id, amenity_id)
);

-- Indexes for join performance
CREATE INDEX idx_prop_amenity_prop_id ON property_amenities(property_id);
CREATE INDEX idx_prop_amenity_amenity_id ON property_amenities(amenity_id);

-- ------------------------
-- BOOKINGS
-- ------------------------
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    property_id INT NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (start_date < end_date)
);

-- Index for booking search
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_user_id ON bookings(user_id);

-- ------------------------
-- REVIEWS
-- ------------------------
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    property_id INT NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for fast lookup
CREATE INDEX idx_review_user_id ON reviews(user_id);
CREATE INDEX idx_review_property_id ON reviews(property_id);
