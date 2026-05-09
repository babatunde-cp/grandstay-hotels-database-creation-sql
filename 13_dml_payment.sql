-- ==================
--  INSERT PAYMENTS
-- ==================
-- Payment records cover all active bookings across 2025 and 2026. 
-- Cancelled and No Show bookings have no payment records as no payment was collected. 
-- Mix of Paid, PartiallyPaid and Pending statuses included.
-- Loyalty discounts applied to Platinum and Gold guests at 10% and 15% respectively.
-- Grand total = (Room rate x Nights stayed) + Service charges
-- Balance due = Grand total - Amount paid.
-- 9% Of Grand Total is added as Tax amount
USE GrandStayDB;
GO

INSERT INTO Payment (Booking_ID, Payment_Method, Payment_Date,Payment_Status, Grand_Total, Discount_Applied,Discount_Amount, Tax_Amount, Amount_Paid,Balance_Due)
VALUES

-- =================================
-- JANUARY 2025 PAYMENTS
-- =================================

(1,  'Card',                '2025-01-10', 'Paid',   1750000.00, '10%',  175000.00,  141750.00,  1750000.00, 0.00), -- 5 nights (10% loyalty discount)
(2,  'Corporate Account',   '2025-01-12', 'Paid',   1400.00,    NULL,   0.00,       126.00,     1400.00,    0.00), -- 4 nights
(3,  'Card',                '2025-01-20', 'Paid',   4250.00,    NULL,   0.00,       382.50,     4250.00,    0.00), -- 5 nights
(4,  'Bank Transfer',       '2025-01-18', 'Paid',   16000.00,   NULL,   0.00,       1440.00,    16000.00,   0.00), -- 2 nights

-- ============================================
-- FEBRUARY 2025 PAYMENTS
-- ============================================

(5,  'Card',             '2025-02-05','Paid',  15000.00,   NULL,  0.00,      1350.00,    15000.00,   0.00), -- 5 nights
(6,  'Mobile Money',     '2025-02-08','Paid',  380000.00,  NULL,  0.00,      34200.00,   380000.00,  0.00), -- 4 nights 
(7,  'Card',             '2025-02-14','Paid',  480.00,     NULL,  0.00,      43.20,      480.00,     0.00), -- 4 nights
(8,  'Corporate Account','2025-02-15','Paid',  25000.00,  '15%',  3750.00,   1912.50,    25000.00,   0.00), -- 5 nights( 15% loyalty discount)
(9,  'Bank Transfer',    '2025-02-22','Paid',  600000.00, '10%',  60000.00,  48600.00,   600000.00,  0.00), -- 5 nights ( 10% loyalty discount, Airport transfer service included)

-- =====================================
-- MARCH 2025 PAYMENTS
-- BK-2025-00010 CANCELLED - No payment
-- ====================================

(11, 'Bank Transfer',    '2025-03-05', 'Paid', 400000.00,  NULL,  0.00,     36000.00,   400000.00,  0.00), -- 5 nights
(12, 'Card',             '2025-03-08', 'Paid', 4800.00,    NULL,  0.00,     432.00,     4800.00,    0.00), -- 4 nights
(13, 'Card',             '2025-03-15','Paid',  750000.00,  '10%', 75000.00, 60750.00,   750000.00,  0.00), -- 5 nights (-- 10% loyalty discount)

-- ==================================
-- APRIL 2025 PAYMENTS
-- BK-2025-00015 NO SHOW - No payment
-- ==================================

(14, 'Cash',               '2025-04-15', 'Paid',           36000.00,   NULL,   0.00,    3240.00,  36000.00,       0.00), -- 3 nights
(16, 'Corporate Account',  '2025-04-05', 'Paid',           3000.00,    NULL,   0.00,    270.00,   3000.00,        0.00), -- 5 nights
(17, 'Card',               '2025-04-10', 'Paid',           6000.00,    NULL,   0.00,    540.00,   6000.00,        0.00), -- 5 nights
(18, 'Bank Transfer',      '2025-04-12', 'Partially Paid', 36000.00,   '10%',  3600.00, 2916.00,  18000.00,   18000.00), -- 6 nights (10% loyalty discount)

-- ====================================
-- MAY 2025 PAYMENTS
-- BK-2025-00020 CANCELLED - No payment
-- ====================================

(19, 'Mobile Money',     '2025-05-14', 'Paid',           135000.00,  NULL,  0.00,        12150.00,   135000.00,       0.00), -- 3 nights
(21, 'Corporate Account','2025-05-05', 'Partially Paid', 1750000.00, '15%', 262500.00,   141750.00,  875000.00,  875000.00), -- 5 nights (15% loyalty discount)
(22, 'Card',             '2025-05-08', 'Paid',           72000.00,   NULL,  0.00,        6480.00,    72000.00,        0.00), -- 4 nights
(23, 'Card',             '2025-05-14', 'Partially Paid', 800.00,     NULL,  0.00,        72.00,      400.00,        400.00), -- 4 nights

-- ===================================
-- JUNE 2025 PAYMENTS
-- BK-2025-00029 NO SHOW - No payment
-- ==================================

(24, 'Cash',            '2025-06-15', 'Paid',           1650.00,    NULL,  0.00,     148.50,     1650.00,         0.00), -- 3 nights
(25, 'Bank Transfer',   '2025-06-20', 'Paid',           150000.00,  NULL,  0.00,     13500.00,   150000.00,       0.00), -- 5 nights
(26, 'Card',            '2025-06-05', 'Paid',           15000.00,   '10%', 1500.00,  1215.00,    15000.00,        0.00), -- 5 nights(10% loyalty discount)
(27, 'Card',            '2025-06-08', 'Partially Paid', 260000.00,  NULL,  0.00,     23400.00,   130000.00,  130000.00), -- 4 nights
(28, 'Bank Transfer',   '2025-06-14', 'Pending',        480.00,     NULL,  0.00,     43.20,      0.00,          480.00), -- 4 nights

-- ============================================
-- JULY 2025 PAYMENTS
-- ============================================

(30, 'Corporate Account','2025-07-05', 'Paid',           10000.00,   NULL,  0.00,         900.00,     10000.00,       0.00), -- 4 nights
(31, 'Card',             '2025-07-05', 'Paid',           475000.00,  '10%', 47500.00,     38475.00,   475000.00,      0.00), -- 5 nights (10% loyalty discount)
(32, 'Bank Transfer',    '2025-07-10', 'Partially Paid', 180000.00,  NULL,  0.00,         16200.00,   90000.00,   90000.00), -- 6 nights
(33, 'Mobile Money',     '2025-07-20', 'Pending',        2450.00,    NULL,  0.00,          220.50,    0.00,        2450.00), -- 7 nights

-- ================================
-- AUGUST 2025 PAYMENTS
-- ================================

(34, 'Card',             '2025-08-10', 'Paid',           6800.00,    NULL, 0.00,         612.00,     6800.00,    0.00), -- 8 nights
(35, 'Bank Transfer',    '2025-08-03', 'Paid',           385000.00,  '15%',57750.00,     29452.50,   385000.00,  0.00), -- 7 nights(15% loyalty discount)
(36, 'Cash',             '2025-08-10', 'Paid',           18000.00,   NULL, 0.00,         1620.00,    18000.00,   0.00), -- 1 night

-- ======================================
-- SEPTEMBER 2025 PAYMENTS
-- BK-2025-00037 CANCELLED - No payment
-- =====================================

(38, 'Cash',             '2025-09-15','Paid',       135000.00,  NULL,  0.00,      12150.00,   135000.00,  0.00), -- 3 nights
(39, 'Corporate Account','2025-09-25','Paid',       4800.00,    '10%', 480.00,     388.80,    4800.00,    0.00), -- 4 nights (10% loyalty discount)

-- ====================================
-- OCTOBER 2025 PAYMENTS
-- BK-2025-00040 NO SHOW - No payment
-- ===================================

(41, 'Card',             '2025-10-05', 'Partially Paid', 475000.00,  NULL, 0.00,    42750.00,   237500.00,  237500.00), -- 5 nights
(42, 'Bank Transfer',    '2025-10-10', 'Paid',           12500.00,   NULL, 0.00,    1125.00,    12500.00,        0.00), -- 5 nights

-- =====================================
-- NOVEMBER 2025 PAYMENTS
-- BK-2025-00045 CANCELLED - No payment
-- =====================================

(43, 'Card',     '2025-11-05', 'Paid',   15000.00,   '10%',  1500.00,    1215.00,    15000.00,   0.00), -- 5 nights (10% loyalty discount)
(44, 'Card',     '2025-11-08', 'Paid',   260000.00,   NULL,  0.00,       23400.00,   260000.00,  0.00), -- 4 nights

-- ============================================
-- DECEMBER 2025 PAYMENTS
-- ============================================

(46, 'Cash',             '2025-12-02', 'Paid',           330000.00,  NULL, 0.00,            29700.00,   330000.00,       0.00), -- 6 nights
(47, 'Corporate Account','2025-12-05','Paid',            6000.00,    NULL,  0.00,           540.00,     6000.00,         0.00), -- 5 nights
(48, 'Mobile Money',     '2025-12-10', 'Paid',           600.00,     NULL,0.00,             54.00,      600.00,          0.00), -- 5 nights
(49, 'Cash',             '2025-12-22', 'Paid',           1200.00,    NULL, 0.00,            108.00,     1200.00,         0.00), -- 6 nights
(50, 'Corporate Account','2025-12-23', 'Partially Paid', 1050000.00, NULL,0.00,             94500.00,   525000.00,  525000.00), -- 7 nights
(51, 'Card',             '2025-12-24', 'Paid',           720.00,     NULL,0.00,             64.80,      720.00,          0.00), -- 6 nights
 
-- ============================================
-- JANUARY 2026 PAYMENTS
-- ============================================

(52, 'Card',             '2026-01-10', 'Paid',       1750000.00,  '10%',   175000.00,    141750.00,  1750000.00, 0.00), -- 5 nights (10% loyalty discount)
(53, 'Corporate Account','2026-01-12', 'Paid',       1400.00,      NULL,   0.00,         126.00,     1400.00,    0.00), -- 4 nights
(54, 'Card',             '2026-01-20', 'Paid',       4250.00,      NULL,   0.00,         382.50,     4250.00,    0.00), -- 5 nights
(55, 'Bank Transfer',    '2026-01-18', 'Paid',       16000.00,     NULL,   0.00,         1440.00,    16000.00,   0.00), -- 2 nights

-- ============================================
-- FEBRUARY 2026 PAYMENTS
-- ============================================

(56, 'Bank Transfer',    '2026-02-07', 'Paid',        480000.00,  '10%', 48000.00,         38880.00,   480000.00,  0.00), -- 4 nights (10% loyalty discount)
(57, 'Card',             '2026-02-10', 'Paid',        15000.00,   NULL,  0.00,             1350.00,    15000.00,   0.00), -- 5 nights
(58, 'Card',             '2026-02-21', 'Paid',        380000.00,  NULL,  0.00,             34200.00,   380000.00,  0.00), -- 4 nights

-- =====================================
-- MARCH 2026 PAYMENTS
-- BK-2026-00059 CANCELLED - No payment
-- =====================================

(60, 'Cash',             '2026-03-05', 'Paid',      400000.00,  NULL,   0.00,         36000.00,   400000.00,  0.00), -- 5 nights 
(61, 'Bank Transfer',    '2026-03-08', 'Paid',      72000.00,   NULL,   0.00,         6480.00,    72000.00,   0.00), -- 4 nights
(62, 'Card',             '2026-03-25' ,'Paid',      750000.00,  '10%',  75000.00,     60750.00,   750000.00,  0.00), -- 5 nights (10% loyalty discount)

-- ===================================
-- APRIL 2026 PAYMENTS
-- BK-2026-00064 NO SHOW - No payment
-- ===================================

(63, 'Cash',             '2026-04-15', 'Paid',           36000.00,   NULL, 0.00,     3240.00,    36000.00,   0.00), -- 3 nights
(65, 'Corporate Account','2026-04-23', 'Paid',           1800.00,    NULL, 0.00,     162.00,     1800.00,    0.00), -- 3 nights
(66, 'Card',             '2026-04-27', 'Paid',           3600.00,    NULL, 0.00,     324.00,     3600.00,    0.00), -- 3 nights

-- ============================================
-- MAY 2026 PAYMENTS
-- BK-2026-00067 CHECKED IN - partial payment
-- BK-2026-00068 CONFIRMED  - pending payment
-- ============================================

(67, 'Corporate Account','2026-05-05', 'Partially Paid', 8400.00,    '15%',  1260.00,        680.40,     4200.00,    4200.00), -- 7 nights (15% loyalty discount)
(68, 'Bank Transfer',    '2026-05-03', 'Pending',        825000.00,   NULL,  0.00,         74250.00,   0.00,       825000.00); -- 15 nights
PRINT '59 Payment record inserted';
GO