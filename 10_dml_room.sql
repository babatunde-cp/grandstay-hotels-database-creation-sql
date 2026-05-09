-- 3: INSERT ROOMS (30 Rooms)

-- ==================================================
-- ALTERING ROOM TABLE (My Observation)
-- Adding currency and USD rate columns
-- To make analysis more understandable when ordering
-- ==================================================

 ALTER TABLE Room
 ADD Currency_Code  NVARCHAR(3)   NOT NULL DEFAULT 'USD',
    Rate_In_USD    DECIMAL(10,2) NOT NULL DEFAULT 0;
GO
 DELETE FROM Room;
GO
 DBCC CHECKIDENT ('Room', RESEED, 0);
GO

ALTER TABLE Room
ADD CONSTRAINT CHK_Room_CurrencyCode
    CHECK (currency_code IN ('NGN', 'GBP', 'AED', 'GHS', 'KES'));
GO

-- ========================================
-- GrandStay Lagos Metro (Hotel_ID - 1)
-- Rate In USD = Room_Rate_Per_Night / 1600
-- ========================================

INSERT INTO Room (Hotel_ID, Room_Number, Room_Type, Floor, Max_Occupancy, Bed_Type, Room_Rate_Per_Night, Currency_Code, Rate_In_USD)
  VALUES
    (1, '101', 'Standard',     2, 2,  'Single',  45000.00,   'NGN',     28.13),
    (1, '202', 'Superior',     3, 4,  'Twin',    65000.00,   'NGN',     40.63),
    (1, '303', 'Deluxe',       4, 5,  'Queen',   95000.00,   'NGN',     59.38),
    (1, '404', 'Suite',        5, 8,  'King',    150000.00,  'NGN',     93.75),
    (1, '505', 'Presidential', 6, 10, 'King',    350000.00,  'NGN',    218.75);
GO

-- ========================================
-- GrandStay Nairobi Lounge (Hotel_ID - 2)
-- Rate In USD = Room_Rate_Per_Night / 129
-- ========================================
INSERT INTO Room (Hotel_ID, Room_Number, Room_Type, Floor, Max_Occupancy, Bed_Type, Room_Rate_Per_Night, Currency_Code, Rate_In_USD)
  VALUES
    (2, '101', 'Standard',     2, 2,  'Single',   8000.00,  'KES',    62.02),
    (2, '202', 'Superior',     3, 4,  'Twin',     12000.00, 'KES',    93.02),
    (2, '303', 'Deluxe',       4, 6,  'Queen',    18000.00, 'KES',   139.53),
    (2, '404', 'Suite',        5, 8,  'King',     30000.00, 'KES',   232.56),
    (2, '505', 'Presidential', 6, 10, 'King',     60000.00, 'KES',   465.12);
GO

-- =========================================
-- GrandStay London Surburb (Hotel_ID - 3)
-- Rate In USD = Room_Rate_Per_Night * 1.27
-- =========================================
INSERT INTO Room (Hotel_ID, Room_Number, Room_Type, Floor, Max_Occupancy, Bed_Type, Room_Rate_Per_Night, Currency_Code, Rate_In_USD)
  VALUES
    (3, '101', 'Standard',     2, 2,  'Single',   120.00,  'GBP',   152.40),
    (3, '202', 'Superior',     3, 4,  'Twin',     200.00,  'GBP',   254.00),
    (3, '303', 'Deluxe',       4, 6,  'Queen',    350.00,  'GBP',   444.50),
    (3, '404', 'Suite',        5, 8,  'King',     600.00,  'GBP',   762.00),
    (3, '505', 'Presidential', 6, 10, 'King',     1200.00, 'GBP',  1524.00);
GO

-- =========================================
-- GrandStay Dubai Luxury (Hotel_ID - 4)
-- Rate In USD = Room_Rate_Per_Night / 3.67
-- =========================================
INSERT INTO Room (Hotel_ID, Room_Number, Room_Type, Floor, Max_Occupancy, Bed_Type, Room_Rate_Per_Night, Currency_Code, Rate_In_USD)
VALUES
    (4, '101', 'Standard',     2, 2,  'Single',   550.00,  'AED',    149.86),
    (4, '202', 'Superior',     3, 4,  'Twin',     850.00,  'AED',    231.61),
    (4, '303', 'Deluxe',       4, 6,  'Queen',    1200.00, 'AED',    326.98),
    (4, '404', 'Suite',        5, 8,  'King',     2500.00, 'AED',    681.20),
    (4, '505', 'Presidential', 6, 10, 'King',     5000.00, 'AED',   1362.40);
GO

-- =========================================
-- GrandStay Accra Urban (Hotel_ID - 5)
-- Rate In USD = Room_Rate_Per_Night / 15.50
-- =========================================
INSERT INTO Room (Hotel_ID, Room_Number, Room_Type, Floor, Max_Occupancy, Bed_Type, Room_Rate_Per_Night, Currency_Code, Rate_In_USD)
  VALUES
    (5, '101', 'Standard',     2, 2,  'Single',  800.00,  'GHS',  51.61),
    (5, '202', 'Superior',     3, 4,  'Twin',    1200.00, 'GHS',  77.42),
    (5, '303', 'Deluxe',       4, 6,  'Queen',   1800.00, 'GHS', 116.13),
    (5, '403', 'Suite',        5, 8,  'King',    3000.00, 'GHS', 193.55),
    (5, '505', 'Presidential', 6, 10, 'King',    6000.00, 'GHS', 387.10);
GO

-- =======================================
-- GrandStay Abuja Prestige (Hotel_id - 6)
-- Rate In USD = Room_Rate_Per_Night / 1600
-- =======================================
INSERT INTO Room (Hotel_ID, Room_Number, Room_Type, Floor, Max_Occupancy, Bed_Type, Room_Rate_Per_Night, Currency_Code, Rate_In_USD)
  VALUES
    (6, '101', 'Standard',     2, 2,  'Single',  35000.00,  'NGN',   21.88),
    (6, '202', 'Superior',     3, 4,  'Twin',    55000.00,  'NGN',   34.38),
    (6, '303', 'Deluxe',       4, 6,  'Queen',   80000.00,  'NGN',   50.00),
    (6, '404', 'Suite',        5, 8,  'King',    120000.00, 'NGN',   75.00),
    (6, '505', 'Presidential', 6, 10, 'King',    280000.00, 'NGN',  175.00);
PRINT '30 rooms inserted'
GO
