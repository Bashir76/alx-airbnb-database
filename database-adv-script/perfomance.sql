-- 1. INITIAL QUERY (Complex)
-- Retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id
INNER JOIN properties p 
    ON b.property_id = p.property_id
INNER JOIN payments pay 
    ON b.booking_id = pay.booking_id;


-- 2. PERFORMANCE ANALYSIS
-- Use EXPLAIN (MySQL) or EXPLAIN ANALYZE (PostgreSQL) before indexes
EXPLAIN
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id
INNER JOIN properties p 
    ON b.property_id = p.property_id
INNER JOIN payments pay 
    ON b.booking_id = pay.booking_id;


-- 3. REFACTORED QUERY
-- Improvements:
-- - Ensure proper indexing on (user_id, property_id, booking_id)
-- - Only select the necessary columns
-- - Reduce join complexity by avoiding extra fields
SELECT 
    b.booking_id,
    b.booking_date,
    u.username,
    p.property_name,
    pay.amount
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id
INNER JOIN properties p 
    ON b.property_id = p.property_id
INNER JOIN payments pay 
    ON b.booking_id = pay.booking_id;


-- 4. PERFORMANCE ANALYSIS AFTER REFACTORING
EXPLAIN
SELECT 
    b.booking_id,
    b.booking_date,
    u.username,
    p.property_name,
    pay.amount
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id
INNER JOIN properties p 
    ON b.property_id = p.property_id
INNER JOIN payments pay 
    ON b.booking_id = pay.booking_id;

