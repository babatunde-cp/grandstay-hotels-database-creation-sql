-- ============================================
--  INSERT SERVICE CHARGES
-- ============================================
-- 49 Service Charge records are inserted here, one row per service consumed during a booking. 
-- Service categories are locked to the valid values defined in the CHECK constraint.


-- ==================================================
-- ALTERING SERVICE CHARGE TABLE
-- Adding currency and USD rate columns
-- ==================================================

 ALTER TABLE Service_Charge
 ADD Currency_Code  NVARCHAR(3)   NOT NULL DEFAULT 'USD',
     Rate_In_USD    DECIMAL(10,2) NOT NULL DEFAULT 0;

ALTER TABLE Service_Charge
ADD CONSTRAINT CHK_Service_CurrencyCode
    CHECK (currency_code IN ('NGN', 'GBP', 'AED', 'GHS', 'KES'));
GO

-- ==============================
-- SERVICES & CHARGES LAGOS
-- ==============================
INSERT INTO Service_Charge (Booking_ID, Service_Name, Service_Used, Service_Date, Service_Cost, Currency_Code, Rate_In_USD)
VALUES
(1,  'Full Body Massage',    'Spa',                '2025-01-12 10:00',  15000.00, 'NGN',    9.38),
(5,  'Airport Transfer',     'Airport Transfer',   '2025-01-27 11:00',  12000.00, 'NGN',    7.50),
(7,  'Minibar Restocking',   'Minibar',            '2025-02-10 18:00',  10000.00, 'NGN',    6.25),
(13, 'Full Body Massage',    'Spa',                '2025-03-16 11:00',  18000.00, 'NGN',   11.25),
(13, 'Airport Transfer',     'Airport Transfer',   '2025-03-20 12:00',  12000.00, 'NGN',    7.50),
(21, 'Butler Service',       'Food and Beverages', '2025-05-06 08:00',  25000.00, 'NGN',   15.63),
(21, 'Full Body Massage',    'Spa',                '2025-05-07 10:00',  18000.00, 'NGN',   11.25),
(31, 'Private Dining',       'Food and Beverages', '2025-07-05 20:00',  15000.00, 'NGN',    9.38),
(41, 'Room Dining',          'Food and Beverages', '2025-10-07 15:00',  20000.00, 'NGN',   12.50),
(50, 'Room Dining',          'Food and Beverages', '2025-12-24 20:00',  20000.00, 'NGN',   12.50),
(62, 'Spa Session',          'Spa',                '2026-03-27 07:00',   5000.00, 'NGN',    3.13);
GO

-- ============================================
-- SERVICES & CHARGES LONDON
-- ============================================
INSERT INTO Service_Charge (Booking_ID, Service_Name, Service_Used, Service_Date, Service_Cost, Currency_Code, Rate_In_USD)
VALUES
(2,  'Swedish Massage',     'Spa',               '2025-01-13 08:00', 120.00, 'GBP', 152.40),
(2,  'Room Dining',         'Food and Beverages','2025-01-14 19:00',  85.00, 'GBP', 107.95),
(16, 'Butler Service',      'Food and Beverages','2025-04-06 09:00',  95.00, 'GBP', 120.65),
(16, 'Room Dining',         'Food and Beverages','2025-04-07 19:00', 120.00, 'GBP', 152.40),
(16, 'Spa Session',         'Spa',               '2025-04-08 07:00',  45.00, 'GBP',  57.15),
(23, 'Swedish Massage',     'Spa',               '2025-05-15 08:00', 120.00, 'GBP', 152.40),
(28, 'Private Dining',      'Food and Beverages','2025-06-17 19:00',  85.00, 'GBP', 107.95),
(48, 'Airport Transfer',    'Airport Transfer',  '2025-12-14 09:00', 100.00, 'GBP', 127.00),
(51, 'Room Dining',         'Food and Beverages','2025-12-25 18:00', 120.00, 'GBP', 152.40),
(65, 'Spa Session',         'Spa',               '2026-04-24 07:00',  45.00, 'GBP',  57.15);
GO

-- ============================================
-- SERVICES & CHARGES DUBAI
-- ============================================
INSERT INTO Service_Charge (Booking_ID, Service_Name, Service_Used, Service_Date, Service_Cost, Currency_Code, Rate_In_USD)
VALUES
(3,  'Airport Transfer',     'Airport Transfer',  '2025-01-22 11:00', 250.00, 'AED',  68.20),
(9,  'Minibar Restocking',   'Minibar',           '2025-02-14 08:00', 800.00, 'AED', 217.00),
(9,  'Spa Treatment',        'Spa',               '2025-02-17 10:00', 650.00, 'AED', 177.11),
(17, 'Private Dining',       'Food and Beverages','2025-02-18 20:00', 420.00, 'AED', 114.44),
(30, 'Spa Treatment',        'Spa',               '2025-06-06 10:00', 750.00, 'AED', 204.40),
(30, 'Room Dining',          'Food and Beverages','2025-06-08 20:00', 380.00, 'AED', 103.50),
(54, 'Spa Session',          'Spa',               '2025-06-18 07:00', 120.00, 'AED',  32.70),
(66, 'Minibar Restocking',   'Minibar',           '2026-04-28 22:00', 180.00, 'AED',  49.10);
GO

-- ============================================
-- SERVICES & CHARGES NAIROBI
-- ============================================
INSERT INTO Service_Charge (Booking_ID, Service_Name, Service_Used, Service_Date, Service_Cost, Currency_Code, Rate_In_USD)
VALUES
(9,  'Airport Transfer',     'Airport Transfer',    '2025-02-22 12:00',  4500.00, 'KES',  34.90),
(9,  'Couples Massage',      'Spa',                 '2025-02-24 14:00',  9000.00, 'KES',  69.77),
(11, 'Airport Transfer',     'Airport Transfer',    '2025-03-08 10:00', 12000.00, 'KES',  93.02),
(25, 'Airport Transfer',     'Airport Transfer',    '2025-06-20 12:00',  4500.00, 'KES',  34.98),
(25, 'Minibar Restocking',   'Minibar',             '2025-06-22 09:00',  2000.00, 'KES',  15.50),
(35, 'Airport Transfer',     'Airport Transfer',    '2025-08-11 14:00',  8000.00, 'KES',  62.01),
(38, 'Spa Treatment',        'Spa',                 '2025-09-16 10:00', 15000.00, 'KES', 116.28),
(46, 'Private Dining',       'Food and Beverages',  '2025-12-05 20:00', 12000.00, 'KES',  93.02);
GO

-- ============================================
-- SERVICES & CHARGESS ACCRA
-- ============================================
INSERT INTO Service_Charge (Booking_ID, Service_Name, Service_Used, Service_Date, Service_Cost, Currency_Code, Rate_In_USD)
VALUES
(18, 'Airport Transfer',     'Airport Transfer',   '2025-04-12 11:00',  380.00, 'GHS', 24.51),
(18, 'Couples Massage',      'Spa',                '2025-04-13 14:00',  520.00, 'GHS', 33.55),
(26, 'Minibar Restocking',   'Minibar',            '2025-06-08 09:00',  800.00, 'GHS', 51.61),
(36, 'Private Dining',       'Food and Beverages', '2025-10-08 19:00',  900.00, 'GHS', 58.06),
(43, 'Couples Massage',      'Spa',                '2025-11-08 10:00',  520.00, 'GHS', 33.55),
(61, 'Private Dining',       'Food and Beverages', '2026-03-09 20:00',  900.00, 'GHS', 58.86);
GO

-- ============================================
--SERVICES & CHARGES ABUJA
-- ============================================
INSERT INTO Service_Charge (Booking_ID, Service_Name, Service_Used, Service_Date, Service_Cost, Currency_Code, Rate_In_USD)
VALUES
(4,  'Spa Session',          'Spa',                 '2025-01-19 09:00',  8500.00, 'NGN', 5.31),
(14, 'Minibar Restocking',   'Minibar',             '2025-04-16 22:00',  8000.00, 'NGN', 5.00),
(22, 'Private Dining',       'Food and Beverages',  '2025-05-08 20:00',  5000.00, 'NGN', 3.13),
(32, 'Airport Transfer',     'Airport Transfer',    '2025-06-11 13:00',  8000.00, 'NGN', 5.00),
(55, 'Private Dining',       'Food and Beverages',  '2026-01-18 18:00', 12000.00, 'NGN', 7.50),
(63, 'Spa Session',          'Spa',                 '2026-04-16 14:00',  8500.00, 'NGN', 5.31);
PRINT '49 Services and Charges inserted';
GO