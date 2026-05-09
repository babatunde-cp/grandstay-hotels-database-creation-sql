# GrandStay Hotels & Resorts — SQL Database Project

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)


## Project Overview

GrandStay Hotels & Resorts is a growing hospitality group operating 
across six international cities **Lagos, Abuja, London, 
Dubai, Accra and Nairobi**. The business had been running its entire 
operation on a single shared Excel workbook for four years — a workbook 
with over 50 columns, duplicate guest records, comma-separated service 
fields, broken formulas, mixed date formats and no reliable way to 
answer basic business questions.

This project replaces that Excel workbook with a **fully normalised 
relational database** built in SQL Server, capable of answering six 
critical business questions through SQL queries that join across 
multiple tables.

---

## 🎯 Business Problem

The operations team had one Excel file doing the job of six. Every 
booking row repeated hotel details, guest details, room details, 
service charges and payment information, which resulted in:

- **Duplicate guest records** with no single source of truth
- **Comma-separated service fields** that could not be aggregated
- **Currency values stored without currency codes** making cross-property 
  revenue comparison meaningless
- **Calculated columns** like nights_stayed and total_room_charge that 
  produced errors when dates conflicted
- **No payment history** only the last payment date was recorded, 
  making partial payment tracking impossible
- **Free text fields** with no standards, the same value spelled 
  differently across rows


## 💡 Solution

A fully normalised six-table relational database designed from scratch 
in SQL Server, replacing the flat Excel structure with a properly 
structured data model that enforces business rules, prevents bad data 
and supports all six business validation queries.

---

## 🗄️ Database Architecture

### Entity Relationship Overview



<img width="1305" height="785" alt="ERD Structure" src="https://github.com/user-attachments/assets/5b8075c8-03fd-4712-8afe-4022b71dbb2a" />




### Table Summary

| Table | Layer | Rows | Description |
|-------|-------|------|-------------|
| Hotel | Master Data | 6 | Core property information for all six cities |
| Guest | Master Data | 22 | Guest profiles, identity and loyalty data |
| Room | Operational Data | 30 | Physical room attributes and nightly rates |
| Booking | Transactional Data | 68 | Reservation records across 2025 and 2026 |
| ServiceCharge | Detail Data | 33 | Individual ancillary service line items |
| Payment | Detail Data | 57 | Payment records with full transaction history |

---

## 🔑 Key Design Decisions

### 1. Surrogate Primary Keys
All six tables use `INT IDENTITY(1,1)` as the primary key. Natural 
keys like `booking_ref` and `guest_email` were rejected because 
booking references had duplicates in the original Excel file and 
emails can change over time making them unstable as primary keys, 
also querying is faster when integers are mainly used as IDs

### 2. Currency Normalisation
The original Excel file stored monetary values without currency codes 
making cross-property comparisons completely meaningless 45,000 NGN 
appeared larger than 120 GBP when in reality 120 GBP is worth more.

Every room rate is now stored in both local currency and USD equivalent:

| Currency | Code | Exchange Rate |
|----------|------|--------------|
| Nigerian Naira | NGN | 1 USD = 1,600 NGN |
| British Pound | GBP | 1 GBP = 1.27 USD |
| UAE Dirham | AED | 1 USD = 3.67 AED |
| Ghanaian Cedi | GHS | 1 USD = 15.50 GHS |
| Kenyan Shilling | KES | 1 USD = 129 KES |

All revenue validation queries convert local amounts to USD using 
CASE statements before aggregating ensuring fair like-for-like 
comparison across all six hotels.

### 3. ServiceCharge Table
The original Excel file stored services_used, service_dates and 
service_costs as three comma-separated columns, which is impossible 
to aggregate reliably. These were replaced by a dedicated 
ServiceCharge table with one row per service consumed, enabling 
accurate grouping, counting and revenue calculation by category.

### 4. Removed Calculated Columns
`nights_stayed`, `total_room_charge` and `total_room_revenue` were 
all removed from the database entirely. These were flagged as 
unreliable in the original Excel file because they produced errors 
when dates conflicted. They are now calculated at query time using:

```sql
DATEDIFF(DAY, check_in_date, check_out_date)
```

### 5. Business Rule Enforcement
CHECK constraints lock critical columns to valid values only:

| Column | Valid Values |
|--------|-------------|
| hotel_star_rating | 3, 4, 5 |
| room_type | Standard, Superior, Deluxe, Suite, Presidential |
| bed_type | King, Queen, Twin, Single |
| booking_status | Confirmed, Checked In, Checked Out, Cancelled, No Show |
| booking_channel | Direct Website, OTA, Walk-In, Corporate, Travel Agent |
| loyalty_tier | None, Silver, Gold, Platinum |
| payment_method | Cash, Card, Bank Transfer, Mobile Money, Corporate Account |
| payment_status | Pending, Partially Paid, Paid, Refunded |
| currency_code | NGN, GBP, AED, GHS, KES |

### 6. Audit Columns
Every table includes:
- `is_active` — BIT flag for soft deletes, default 1
- `created_at` — DATETIME, defaults to GETDATE()
- `updated_at` — DATETIME, updated on every change



## Business Questions Answered

### Q1 — Which hotels generate the most revenue?
```sql
-- Joins Hotel, Room, Booking, Payment
-- Converts all revenue to USD for fair comparison
-- Groups by hotel, orders by USD revenue descending
```

### Q2 — Which room types have the highest occupancy?
```sql
-- Joins Hotel, Room, Booking
-- Counts completed bookings and total nights per room type
-- Uses DATEDIFF to calculate nights at query time
```

### Q3 — Which loyalty tier spends the most per stay?
```sql
-- Joins Guest, Room, Booking, Payment
-- Converts spend to USD before averaging
-- Groups by loyalty tier
```

### Q4 — Most popular ancillary service by revenue?
```sql
-- Joins ServiceCharge, Booking, Room
-- Converts service costs to USD
-- Groups by service category
```

### Q5 — Which bookings have an outstanding balance?
```sql
-- Joins Payment, Booking, Guest, Room, Hotel
-- Converts balance_due to USD for fair ranking
-- Filters WHERE balance_due > 0
```

### Q6 — How does booking volume trend month by month?
```sql
-- Joins Booking and Payment using LEFT JOIN
-- Groups by year and month chronologically
-- CASE statements count each status separately
```


##  DML Operations Demonstrated

| Operation | Description |
|-----------|-------------|
| INSERT | 6 hotels, 22 guests, 30 rooms, 68 bookings, 49 services, 59 payments |
| UPDATE | Guest phone number and loyalty points updated with business justification |
| Soft DELETE | Hotel set to is_active = 0 for renovation period |
| Hard DELETE | Test booking permanently removed inside a transaction with ROLLBACK safety |
| MERGE | Guest staging table synced — new guests inserted, existing guests updated |



##  Data Summary

| Metric | Value |
|--------|-------|
| Total Hotels | 6 |
| Total Cities | 6 |
| Total Guests | 22 |
| Total Rooms | 30 |
| Total Bookings | 68 |
| Date Range | January 2025 — May 2026 |
| Booking Statuses | Checked Out, Checked In, Confirmed, Cancelled, No Show |
| Loyalty Tiers | None, Silver, Gold, Platinum |
| Service Categories | Spa, Food & Beverage, Airport Transfer, Minibar |
| Payment Statuses | Paid, Partially Paid, Pending |
| Currencies Supported | NGN, GBP, AED, GHS, KES |

---

##  Skills Demonstrated

- **Database Design** — Entity identification, normalisation, 
  relationship mapping and ERD creation
- **DDL** — CREATE DATABASE, CREATE TABLE, ALTER TABLE, 
  constraints, indexes and audit columns
- **DML** — INSERT, UPDATE, DELETE, MERGE and transaction 
  management
- **SQL Querying** — Multi-table JOINs, LEFT JOINs, 
  aggregate functions, CASE statements, DATEDIFF, 
  DATENAME, CAST and COALESCE
- **Data Quality** — Identifying and fixing real world 
  data problems including duplicates, mixed formats, 
  calculated columns and comma-separated fields
- **Business Thinking** — Translating business questions 
  into database design decisions and SQL queries

## How to Run
1. Open SQL Server Management Studio (SSMS)
2. Run scripts in the sql/ folder in numbered order
3. Run validation queries in 15_validation_queries.sql
4. All six validation tests should return results


## Author
**Babatunde Kareem**  

