# Index Performance

## Objective
Identify and create indexes to improve query performance.

## Steps

### 1. Identify High-Usage Columns
- **Users Table**: `user_id`, `username`
- **Bookings Table**: `user_id`, `property_id`, `booking_date`
- **Properties Table**: `property_id`, `property_name`

These columns are frequently used in `WHERE`, `JOIN`, or `ORDER BY` clauses.

### 2. Create Indexes
```sql
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_username ON users(username);

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_name ON properties(property_name);
