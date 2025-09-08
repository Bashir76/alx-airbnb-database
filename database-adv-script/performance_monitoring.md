# Performance Monitoring

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## Instructions

### 1. Monitor Query Performance
Use SQL commands to check execution details of frequently used queries.

```sql
-- Example with MySQL
EXPLAIN
SELECT 
    u.user_id, u.username, COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.username;

SHOW PROFILE;

-- Example with PostgreSQL
EXPLAIN ANALYZE
SELECT 
    p.property_id, p.property_name, COUNT(b.booking_id) AS total_bookings
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name;
