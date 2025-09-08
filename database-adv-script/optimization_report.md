# Optimization Report

## Objective
Refactor complex queries to improve performance.

## Analysis
The initial query retrieved all bookings with user, property, and payment details.  
When analyzed with `EXPLAIN`, inefficiencies were identified:
- Too many columns selected unnecessarily.
- Large joins scanning more data than required.
- Missing indexes on join columns.

## Refactoring
The query was refactored by:
- Selecting only required columns (`booking_id`, `booking_date`, `username`, `property_name`, `amount`).
- Ensuring indexes exist on `user_id`, `property_id`, and `booking_id`.

## Improvements
- Execution plan showed fewer scanned rows due to indexes.
- Reduced I/O load by limiting selected columns.
- Faster join execution and overall lower query cost.

