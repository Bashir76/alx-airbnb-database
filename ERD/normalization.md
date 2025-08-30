# Airbnb Database Normalization (3NF)

## Step 1: First Normal Form (1NF)
**Definition:**  
- All attributes must be atomic (no repeating groups or arrays).  
- Each row is unique and identifiable by a primary key.  

**Check against schema:**  
- ✅ Each table has a clear **primary key** (`UUIDs`).  
- ✅ Attributes are atomic: names, emails, dates, prices are single-valued.  
- ✅ No repeating groups.  

**Conclusion:** Schema satisfies **1NF**.

---

## Step 2: Second Normal Form (2NF)
**Definition:**  
- Must already be in 1NF.  
- All non-key attributes must depend on the **whole primary key** (no partial dependency).  

**Check against schema:**  
- All PKs are single-column `UUIDs`.  
- There are no composite keys in this design → no partial dependency possible.  

**Conclusion:** Schema satisfies **2NF**.

---

## Step 3: Third Normal Form (3NF)
**Definition:**  
- Must already be in 2NF.  
- No transitive dependencies (non-key attributes should depend only on the key, not on another non-key attribute).  

**Check against schema:**  

- **User Table**:  
  - `email` is unique → fine.  
  - `role` is independent of other attributes.  
  - No transitive dependencies.  

- **Property Table**:  
  - `price_per_night` depends only on `property_id`.  
  - `location` is stored as a string (could later be split into structured `city, country`, but not a violation).  
  - No redundancy → ✅  

- **Booking Table**:  
  - `total_price` can be considered *derived* (since `price_per_night × nights = total_price`).  
  - **Normalization step:** Either remove `total_price` and calculate on query, or keep it as a denormalized field for performance. If aiming for strict 3NF → remove it.  

- **Payment Table**:  
  - No redundancy. All depends on `payment_id`. ✅  

- **Review Table**:  
  - `rating` and `comment` depend only on `review_id`. ✅  

- **Message Table**:  
  - All attributes depend on `message_id`. ✅  

---

## Adjustments for 3NF
1. **Remove `total_price` from Booking** (since it is derived from `price_per_night × number_of_days`).  
   - Store only `start_date` and `end_date`.  
   - Calculate `total_price` in queries or views.  

2. (Optional) Normalize **location** into a separate `Location` table if detailed filtering is needed.  
   - `Property(property_id, location_id FK)`  
   - `Location(location_id, city, state, country)`  
   - This avoids location string inconsistencies.  

---

## Final 3NF Schema (Summary)

### User
- `user_id (PK)`
- `first_name, last_name, email (UNIQUE), password_hash, phone_number, role, created_at`

### Property
- `property_id (PK)`
- `host_id (FK → User.user_id)`
- `name, description, location (or location_id FK), price_per_night, created_at, updated_at`

### Booking
- `booking_id (PK)`
- `property_id (FK → Property.property_id)`
- `user_id (FK → User.user_id)`
- `start_date, end_date, status, created_at`
- ❌ Removed: `total_price` (calculated when needed)

### Payment
- `payment_id (PK)`
- `booking_id (FK → Booking.booking_id)`
- `amount, payment_date, payment_method`

### Review
- `review_id (PK)`
- `property_id (FK → Property.property_id)`
- `user_id (FK → User.user_id)`
- `rating, comment, created_at`

### Message
- `message_id (PK)`
- `sender_id (FK → User.user_id)`
- `recipient_id (FK → User.user_id)`
- `message_body, sent_at`

---
