-- VALIDATION QUERIES
-- ===================================

-- ============================================
-- VALIDATION QUERY 1
-- Which hotels generate the most revenue?
-- What is the average revenue per booking?
-- =================================================
-- Joins Hotel, Room, Booking and Payment Tables
-- Group by hotel to show total and average revenue
-- Ordered by highest revenue first. 
-- Used Rate_in_USD for currency comparison 
-- =================================================

SELECT
    h.Hotel_Name,
    h.Hotel_Country,
    h.Hotel_Star_Rating,
    COUNT(DISTINCT b.Booking_ID)                AS Total_Bookings,
    r.Currency_Code                             AS Currency,
    -- Local currency totals
    CAST(SUM(p.Grand_Total) 
        AS DECIMAL(10,2))                       AS Total_Revenue_Local,

    CAST(AVG(p.Grand_Total) 
        AS DECIMAL(10,2))                       AS Avg_Revenue_Local,
    -- USD conversion
    CAST(SUM(
        CASE r.Currency_Code
            WHEN 'NGN' THEN p.Grand_Total / 1600.0
            WHEN 'GBP' THEN p.Grand_Total * 1.27
            WHEN 'AED' THEN p.Grand_Total / 3.67
            WHEN 'GHS' THEN p.Grand_Total / 15.50
            WHEN 'KES' THEN p.Grand_Total / 129.0
            ELSE p.Grand_Total
        END) AS DECIMAL(10,2))                         AS Total_Revenue_USD,

    CAST(AVG(
        CASE r.Currency_Code
            WHEN 'NGN' THEN p.Grand_Total / 1600.0
            WHEN 'GBP' THEN p.Grand_Total * 1.27
            WHEN 'AED' THEN p.Grand_Total / 3.67
            WHEN 'GHS' THEN p.Grand_Total / 15.50
            WHEN 'KES' THEN p.Grand_Total / 129.0
            ELSE p.Grand_Total
        END) AS DECIMAL(10,2))                         AS Avg_Revenue_USD
FROM Hotel h
JOIN Room r        ON h.Hotel_ID   = r.Hotel_ID
JOIN Booking b     ON r.Room_ID    = b.Room_ID
JOIN Payment p     ON b.Booking_ID = p.Booking_ID
WHERE b.Booking_Status NOT IN ('Cancelled', 'No Show')
AND   h.Is_Active = 1
GROUP BY
    h.Hotel_Name,
    h.Hotel_Country,
    h.Hotel_Star_Rating,
    r.Currency_Code
ORDER BY Total_Revenue_USD DESC;
GO

-- ============================================
-- VALIDATION QUERY 2
-- Which room types have the highest occupancy rates across all hotels?
-- ============================================
-- Join Hotel, Room and Booking
-- Count completed bookings per room type across all active hotels
-- Ordered by highest occupancy first.
-- ============================================

SELECT
    r.Room_Type,
    COUNT(b.Booking_ID)                                                                   AS Total_bookings,
    COUNT(DISTINCT r.Room_ID)                                                             AS Total_rooms,
    ROUND(CAST(COUNT(b.Booking_ID) AS FLOAT) / NULLIF(COUNT(DISTINCT r.Room_id), 0), 2)   AS Bookings_per_room,
    SUM(DATEDIFF(DAY, b.check_in_date,b.check_out_date))                                  AS Total_nights_occupied
FROM Room r
JOIN Hotel h   ON r.Hotel_ID   = h.Hotel_ID
JOIN Booking b ON r.Room_ID    = b.Room_ID
WHERE b.Booking_Status = 'Checked Out'
AND   h.Is_Active      = 1
GROUP BY r.Room_Type
ORDER BY Total_bookings DESC;
GO

-- ============================================
-- VALIDATION QUERY 3
-- Which guest loyalty tier spends the most on average per stay?
-- ============================================
-- Join Guest, Booking and Payment
-- Group by loyalty tier to show average spend per booking 
-- Ordered by highest spending tier
-- ============================================

SELECT
    g.Loyalty_Tier,
    COUNT(DISTINCT g.Guest_ID)                      AS Total_Guests,
    COUNT(b.Booking_ID)                             AS Total_Bookings,
    CAST(AVG(
        CASE r.Currency_Code
            WHEN 'NGN' THEN p.Grand_Total / 1600.0
            WHEN 'GBP' THEN p.Grand_Total * 1.27
            WHEN 'AED' THEN p.Grand_Total / 3.67
            WHEN 'GHS' THEN p.Grand_Total / 15.50
            WHEN 'KES' THEN p.Grand_Total / 129.0
            ELSE p.Grand_Total
        END
    ) AS DECIMAL(10,2))                             AS Avg_Spend_USD,

    CAST(AVG(
        CASE r.Currency_Code
            WHEN 'NGN' THEN p.Amount_Paid / 1600.0
            WHEN 'GBP' THEN p.Amount_Paid * 1.27
            WHEN 'AED' THEN p.Amount_Paid / 3.67
            WHEN 'GHS' THEN p.Amount_Paid / 15.50
            WHEN 'KES' THEN p.Amount_Paid / 129.0
            ELSE p.Amount_Paid
        END
    ) AS DECIMAL(10,2))                             AS Avg_Amount_Paid_USD,

    CAST(SUM(
        CASE r.Currency_Code
            WHEN 'NGN' THEN p.Grand_Total / 1600.0
            WHEN 'GBP' THEN p.Grand_Total * 1.27
            WHEN 'AED' THEN p.Grand_Total / 3.67
            WHEN 'GHS' THEN p.Grand_Total / 15.50
            WHEN 'KES' THEN p.Grand_Total / 129.0
            ELSE p.Grand_Total
        END
    ) AS DECIMAL(10,2))                             AS Total_Revenue_USD,

    CAST(AVG(
        CASE r.Currency_Code
            WHEN 'NGN' THEN p.Discount_Amount / 1600.0
            WHEN 'GBP' THEN p.Discount_Amount * 1.27
            WHEN 'AED' THEN p.Discount_Amount / 3.67
            WHEN 'GHS' THEN p.Discount_Amount / 15.50
            WHEN 'KES' THEN p.Discount_Amount / 129.0
            ELSE p.Discount_Amount
        END
    ) AS DECIMAL(10,2))                             AS Avg_Discount_USD

FROM Guest g
JOIN Booking b  ON g.Guest_ID   = b.Guest_ID
JOIN Room r     ON b.Room_ID    = r.Room_ID
JOIN Payment p  ON b.Booking_ID = p.Booking_ID
WHERE b.Booking_Status NOT IN ('Cancelled', 'No Show')
GROUP BY g.Loyalty_Tier
ORDER BY Avg_Spend_USD DESC;
GO


-- ============================================
-- VALIDATION QUERY 4
-- What is the most popular ancillary service category by total revenue?
-- ============================================
-- Join Booking and Service_Charge
-- Group by service used to show total revenue and number of times each service was used
-- Ordered by highest revenue first.
-- ============================================

SELECT
    sc.Service_Used,                            
    COUNT(sc.Service_ID)                        AS No_Times_Used,
    COUNT(DISTINCT sc.Booking_ID)               AS Bookings_Using_Service,

    CAST(SUM(
        CASE r.Currency_Code
            WHEN 'NGN' THEN sc.Service_Cost / 1600.0
            WHEN 'GBP' THEN sc.Service_Cost * 1.27
            WHEN 'AED' THEN sc.Service_Cost / 3.67
            WHEN 'GHS' THEN sc.Service_Cost / 15.50
            WHEN 'KES' THEN sc.Service_Cost / 129.0
            ELSE sc.Service_Cost
        END
    ) AS DECIMAL(10,2))                         AS Total_Revenue_USD,

    CAST(AVG(
        CASE r.Currency_Code
            WHEN 'NGN' THEN sc.Service_Cost / 1600.0
            WHEN 'GBP' THEN sc.Service_Cost * 1.27
            WHEN 'AED' THEN sc.Service_Cost / 3.67
            WHEN 'GHS' THEN sc.Service_Cost / 15.50
            WHEN 'KES' THEN sc.Service_Cost / 129.0
            ELSE sc.Service_Cost
        END
    ) AS DECIMAL(10,2))                         AS Avg_Cost_Per_Service_USD,

    CAST(MIN(
        CASE r.Currency_Code
            WHEN 'NGN' THEN sc.Service_Cost / 1600.0
            WHEN 'GBP' THEN sc.Service_Cost * 1.27
            WHEN 'AED' THEN sc.Service_Cost / 3.67
            WHEN 'GHS' THEN sc.Service_Cost / 15.50
            WHEN 'KES' THEN sc.Service_Cost / 129.0
            ELSE sc.Service_Cost
        END
    ) AS DECIMAL(10,2))                         AS Min_Cost_USD,

    CAST(MAX(
        CASE r.Currency_Code
            WHEN 'NGN' THEN sc.Service_Cost / 1600.0
            WHEN 'GBP' THEN sc.Service_Cost * 1.27
            WHEN 'AED' THEN sc.Service_Cost / 3.67
            WHEN 'GHS' THEN sc.Service_Cost / 15.50
            WHEN 'KES' THEN sc.Service_Cost / 129.0
            ELSE sc.Service_Cost
        END
    ) AS DECIMAL(10,2))                         AS Max_Cost_USD

FROM Service_Charge sc
JOIN Booking b  ON sc.Booking_ID = b.Booking_ID
JOIN Room r     ON b.Room_ID     = r.Room_ID
WHERE b.Booking_Status NOT IN ('Cancelled', 'No Show')
AND   sc.Is_Active = 1
GROUP BY sc.Service_Used
ORDER BY Total_Revenue_USD DESC;
GO
-- ============================================
-- VALIDATION QUERY 5
-- Which bookings currently have an outstanding balance due?
-- ============================================
-- Join Payment, Booking, Guest, Room and Hotel 
-- To show full details of every booking with a balance greater than zero
-- Ordered by highest balance first.
-- ============================================

SELECT
    b.Booking_Ref,
    h.Hotel_Name,
    b.Check_In_Date,
    b.Check_Out_Date,
    DATEDIFF(
        DAY,
        b.Check_In_Date,
        b.Check_Out_Date)                              AS Nights_Stayed,
    p.Payment_Method,
    p.Payment_Status,
    r.Currency_Code                                    AS Currency,

    -- Local currency amounts
    CAST(p.Grand_Total  AS DECIMAL(10,2))   AS Grand_Total_Local,
    CAST(p.Amount_Paid  AS DECIMAL(10,2))   AS Amount_Paid_Local,
    CAST(p.Balance_Due  AS DECIMAL(10,2))   AS Balance_Due_Local,
    -- USD equivalent amounts
    CAST(
        CASE r.Currency_Code
            WHEN 'NGN' THEN p.Grand_Total / 1600.0
            WHEN 'GBP' THEN p.Grand_Total * 1.27
            WHEN 'AED' THEN p.Grand_Total / 3.67
            WHEN 'GHS' THEN p.Grand_Total / 15.50
            WHEN 'KES' THEN p.Grand_Total / 129.0
            ELSE p.Grand_Total
        END
    AS DECIMAL(10,2))                       AS Grand_Total_USD,

    CAST(
          CASE r.Currency_Code
            WHEN 'NGN' THEN p.Amount_Paid / 1600.0
            WHEN 'GBP' THEN p.Amount_Paid * 1.27
            WHEN 'AED' THEN p.Amount_Paid / 3.67
            WHEN 'GHS' THEN p.Amount_Paid / 15.50
            WHEN 'KES' THEN p.Amount_Paid / 129.0
            ELSE p.Amount_Paid
        END
    AS DECIMAL(10,2))                       AS Amount_Paid_USD,

    CAST(
        CASE r.Currency_Code
            WHEN 'NGN' THEN p.Balance_Due / 1600.0
            WHEN 'GBP' THEN p.Balance_Due * 1.27
            WHEN 'AED' THEN p.Balance_Due / 3.67
            WHEN 'GHS' THEN p.Balance_Due / 15.50
            WHEN 'KES' THEN p.Balance_Due / 129.0
            ELSE p.Balance_Due
        END
    AS DECIMAL(10,2))                       AS Balance_Due_USD

FROM Payment p
JOIN Booking b  ON p.Booking_ID  = b.Booking_ID
JOIN Guest g    ON b.Guest_ID    = g.Guest_ID
JOIN Room r     ON b.Room_ID     = r.Room_ID
JOIN Hotel h    ON r.Hotel_ID    = h.Hotel_ID
WHERE p.Balance_Due > 0
AND   b.Booking_Status NOT IN ('Cancelled', 'No Show')
ORDER BY Balance_Due_USD DESC;
GO

-- ============================================
-- VALIDATION QUERY 6
-- How does booking volume and revenue trend month by month?
-- ============================================
-- Join Booking and Payment
-- Group by year and month to show booking volume and revenue trends 
-- ============================================

SELECT
    YEAR(b.Booking_Date)                        AS Booking_Year,
    MONTH(b.Booking_Date)                       AS Booking_Month,
    DATENAME(MONTH, b.Booking_Date)             AS Month_Name,
    COUNT(DISTINCT b.Booking_ID)                AS Total_Bookings,
    COUNT(DISTINCT CASE
        WHEN b.Booking_Status = 'Checked Out'
        THEN b.Booking_ID END)                  AS Completed_Bookings,
    COUNT(DISTINCT CASE
        WHEN b.Booking_Status = 'Cancelled'
        THEN b.Booking_ID END)                  AS Cancelled_Bookings,
    COUNT(DISTINCT CASE
        WHEN b.Booking_Status = 'No Show'
        THEN b.Booking_ID END)                  AS No_Show_Bookings,
    CAST(COALESCE(SUM(p.Grand_Total), 0)
        AS DECIMAL(10,2))                       AS Total_Revenue,
    CAST(COALESCE(SUM(p.Amount_Paid), 0)
        AS DECIMAL(10,2))                       AS Total_Collected,
    CAST(COALESCE(SUM(p.Balance_Due), 0)
        AS DECIMAL(10,2))                       AS Total_Outstanding,
    CAST(COALESCE(AVG(p.Grand_Total), 0)
        AS DECIMAL(10,2))                       AS Avg_Booking_Value
FROM Booking b
LEFT JOIN Payment p ON b.Booking_ID = p.Booking_ID
GROUP BY
    YEAR(b.Booking_Date),
    MONTH(b.Booking_Date),
    DATENAME(MONTH, b.Booking_Date)
ORDER BY
    Booking_Year  ASC,
    Booking_Month ASC;
GO