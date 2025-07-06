-- Index to speed up joining bookings to users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index to speed up joining bookings to properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- (Optional) Indexes on primary key columns, usually already exist
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_properties_id ON properties(id);
