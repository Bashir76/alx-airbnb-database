# AirBnB Database Specification

## Entities and Attributes

### User
- **PK:** `user_id (UUID)`
- **Attributes:**
  - `first_name`
  - `last_name`
  - `email (UNIQUE)`
  - `password_hash`
  - `phone_number (nullable)`
  - `role (guest, host, admin)`
  - `created_at`

---

### Property
- **PK:** `property_id (UUID)`
- **FK:** `host_id → User(user_id)`
- **Attributes:**
  - `name`
  - `description`
  - `location`
  - `price_per_night`
  - `created_at`
  - `updated_at`

---

### Booking
- **PK:** `booking_id (UUID)`
- **FK1:** `property_id → Property(property_id)`
- **FK2:** `user_id → User(user_id)` (guest making booking)
- **Attributes:**
  - `start_date`
  - `end_date`
  - `total_price`
  - `status (pending, confirmed, canceled)`
  - `created_at`

---

### Payment
- **PK:** `payment_id (UUID)`
- **FK:** `booking_id → Booking(booking_id)`
- **Attributes:**
  - `amount`
  - `payment_date`
  - `payment_method (credit_card, paypal, stripe)`

---

### Review
- **PK:** `review_id (UUID)`
- **FK1:** `property_id → Property(property_id)`
- **FK2:** `user_id → User(user_id)` (guest writing review)
- **Attributes:**
  - `rating (1–5)`
  - `comment`
  - `created_at`

---

### Message
- **PK:** `message_id (UUID)`
- **FK1:** `sender_id → User(user_id)`
- **FK2:** `recipient_id → User(user_id)`
- **Attributes:**
  - `message_body`
  - `sent_at`

---

## Relationships

### User – Property
- **One-to-Many:** A user (host) can have many properties.  
  `User.user_id (host) → Property.host_id`

### User – Booking
- **One-to-Many:** A user (guest) can make many bookings.  
  `User.user_id → Booking.user_id`

### Property – Booking
- **One-to-Many:** A property can be booked many times.  
  `Property.property_id → Booking.property_id`

### Booking – Payment
- **One-to-One (or One-to-Many if partial payments are allowed):** A booking has one payment.  
  `Booking.booking_id → Payment.booking_id`

### Property – Review
- **One-to-Many:** A property can have many reviews.  
  `Property.property_id → Review.property_id`

### User – Review
- **One-to-Many:** A user (guest) can write many reviews.  
  `User.user_id → Review.user_id`

### User – Message (Self-relationship)
- **One-to-Many:** A user can send many messages to another user.  
  `User.user_id → Message.sender_id`  
  `User.user_id → Message.recipient_id`

---

## ER Diagram 

User ─────< Property
   │            │
   │            └─────< Review >───── User (guest)
   │
   └─────< Booking >───── Property
             │
             └───── Payment

User ─────< Message >───── User
