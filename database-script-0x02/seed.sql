-- ========================================
-- Airbnb Database Sample Data (seed.sql)
-- ========================================

-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '+1234567890', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '+1987654321', 'host'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '+1478523690', 'guest'),
('44444444-4444-4444-4444-444444444444', 'Diana', 'Lopez', 'diana@example.com', 'hashed_pw4', '+1098765432', 'host'),
('55555555-5555-5555-5555-555555555555', 'Admin', 'User', 'admin@example.com', 'hashed_pw5', '+1000000000', 'admin');

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night) VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment', 'A lovely 2-bedroom apartment near downtown.', 'New York, USA', 120.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', 'Beach House', 'Beautiful house with ocean views.', 'Miami, USA', 300.00),
('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '22222222-2222-2222-2222-222222222222', 'Mountain Cabin', 'Rustic cabin perfect for a weekend getaway.', 'Denver, USA', 150.00);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, status) VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-10-10', '2025-10-15', 'pending'),
('bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '11111111-1111-1111-1111-111111111111', '2025-12-20', '2025-12-25', 'cancelled');

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, 'credit_card'),
('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 1500.00, 'paypal');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Amazing place! Very comfortable and close to everything.'),
('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Great view and location, but a bit pricey.');

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, I would like to book your apartment next month.'),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hello Alice, thank you for your interest! The apartment is available.');
