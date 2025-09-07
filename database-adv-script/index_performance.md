-- =======================================
-- DATABASE INDEXING FOR PERFORMANCE
-- =======================================

-- Objective:
-- Identify high-usage columns in User, Booking, and Property tables 
-- (commonly used in WHERE, JOIN, and ORDER BY clauses)
-- Then create indexes to improve query performance.

-- 1. USER TABLE
-- High-usage column: user_id (frequently used in JOINs with bookings)
CREATE INDEX idx_users_user_id 
ON users(user_id);

-- High-usage column: username (likely used in WHERE or search queries)
CREATE INDEX idx_users_username 
ON users(username);


-- 2. BOOKING TABLE
-- High-usage columns: user_id and property_id (used in JOINs with users and properties)
CREATE INDEX idx_bookings_user_id 
ON bookings(user_id);

CREATE INDEX idx_bookings_property_id 
ON bookings(property_id);

-- High-usage column: booking_date (used in WHERE filters or ORDER BY)
CREATE INDEX idx_bookings_booking_date 
ON bookings(booking_date);


-- 3. PROPERTY TABLE
-- High-usage column: property_id (used in JOINs with bookings and reviews)
CREATE INDEX idx_properties_property_id 
ON properties(property_id);

-- High-usage column: property_name (used in search queries)
CREATE INDEX idx_properties_name 
ON properties(property_name);


-- =======================================
-- PERFORMANCE TESTING
-- =======================================
-- Before and after adding indexes, measure performance using EXPLAIN or ANALYZE

-- Example: Check query plan for user bookings
EXPLAIN
SELECT 
    u.user_id, u.username, COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.username;

-- Example: Check query plan for property ranking
EXPLAIN
SELECT 
    p.property_id, p.property_name, COUNT(b.booking_id) AS total_bookings
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name;

