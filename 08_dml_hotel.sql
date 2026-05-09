-- ===========================================================================
/* DML SCRIPT OPERATION 
==============================================================================
   -- DATA INSERTION 
       - 6 hotels
       - 5 room types
       - 20 guests
       - 30 rooms
       - 68 bookings with different statuses (Confirmed,Checked In,Checked Out,Cancelled,No Show)
       - 49 service charge records
       - Payments with a mix of Paid, Partially Paid and Pending records
   -- UPDATE with a business justification
   -- Soft DELETE — setting is_active to 0
   -- Hard DELETE inside a transaction
   -- MERGE - syncing from a staging table */
   -----------------------------------------------------------------------------




/* ============================================================
   -- POPULATING THE DATABASE
   ============================================================
    Order:
     1. Hotel            (no dependencies)
     2. Guest            (no dependencies)
     3. Room             (depends on Hotel)
     4. Booking          (depends on Room,Guest)
     5. Service Charge   (depends on Booking)
     6. Payment          (depends on Booking)
     =======================================================*/

     -- 1: INSERT HOTELS (6 Hotels)

USE GrandStayDB;
GO

INSERT INTO Hotel (Hotel_Name, Hotel_City, Hotel_Country, Hotel_Star_Rating)
VALUES
    ('GrandStay Lagos Metro',       'Lagos',     'Nigeria',       5),
    ('GrandStay Nairobi Lounge',    'Nairobi',   'Kenya',         4),
    ('GrandStay London Surburb',    'London',    'England',       3),
    ('GrandStay Dubai Luxury',      'Dubai',     'UAE',           5),
    ('GrandStay Accra Urban',       'Accra',     'Ghana',         3),
    ('GrandStay Abuja Prestige',    'Abuja',     'Nigeria',       4);
  PRINT '6 hotel locations inserted'
GO
