-- Initial query: Retrieve all bookings with user, property, and payment details
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
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id;

-- Analyze performance using EXPLAIN
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
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id;

-- Refactored query: Select fewer columns, rely on indexes
SELECT 
    b.booking_id,
    b.booking_date,
    u.username,
    p.property_name,
    pay.amount
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id;

-- Analyze performance of the refactored query
EXPLAIN
SELECT 
    b.booking_id,
    b.booking_date,
    u.username,
    p.property_name,
    pay.amount
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id;
