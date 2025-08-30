-- Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('u1', 'Alice', 'Johnson', 'alice@example.com', 'hash1', '1234567890', 'guest'),
('u2', 'Bob', 'Smith', 'bob@example.com', 'hash2', '9876543210', 'host'),
('u3', 'Charlie', 'Brown', 'charlie@example.com', 'hash3', NULL, 'admin');

-- Properties
INSERT INTO Properties (property_id, host_id, name, description, location, price_per_night)
VALUES
('p1', 'u2', 'Cozy Apartment', 'A nice place in the city center.', 'New York', 120.00),
('p2', 'u2', 'Beach House', 'Perfect for vacations.', 'California', 250.00);

-- Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('b1', 'p1', 'u1', '2025-09-01', '2025-09-05', 480.00, 'confirmed'),
('b2', 'p2', 'u1', '2025-10-10', '2025-10-15', 1250.00, 'pending');

-- Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES
('pay1', 'b1', 480.00, 'credit_card'),
('pay2', 'b2', 1250.00, 'paypal');

-- Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES
('r1', 'p1', 'u1', 5, 'Amazing stay, very clean!'),
('r2', 'p2', 'u1', 4, 'Great house but a bit expensive.');

-- Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES
('m1', 'u1', 'u2', 'Hi, is your property available next month?'),
('m2', 'u2', 'u1', 'Yes, it is available. You can book it anytime.');
