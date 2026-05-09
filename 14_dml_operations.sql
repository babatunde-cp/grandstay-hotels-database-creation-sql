-- ===============================================
-- Business Justification: UPDATE, DELETE, MERGE
-- ===============================================

-- ================================================================================================================
-- OPERATION 1: UPDATE
-- Guest Aisha Malik (Guest_id = 9) has accumulated enough points to be upgraded to Platinum tier. 
-- She has also contacted the front desk to update her phone number.
-- We update both fields (BUSINESS REASON) and update the updated_at timestamp to reflect when the change was made.
-- ================================================================================================================

UPDATE Guest
SET
    Phone                 = '+971 306 887 802',
    Loyalty_Point_Balance = Loyalty_Point_Balance + 5000,
    Updated_At            = GETDATE()
WHERE Guest_id = 9;
GO

UPDATE Guest
SET
    Loyalty_Tier = 'Platinum',
    Updated_At   = GETDATE()
WHERE Guest_id = 9;
GO

-- Verify the update
SELECT
    Guest_ID,
    First_Name + ' ' + Last_Name AS Full_Name,
    Phone,
    Loyalty_Tier,
    Loyalty_Point_Balance,
    Updated_At
FROM Guest
WHERE Guest_ID = 9;
GO

-- ===============================================================================================
-- OPERATION 2: SOFT DELETE
-- GrandStay Nairobi Lounge is temporarily closing for renovation. 
-- The hotel record must not be deleted permanently as it has bookings and rooms are linked to it. 
-- So, we have to set Is_Active = 0 to hide it from active operations while preserving old data.
-- ===============================================================================================

UPDATE Hotel
SET
    Is_Active  = 0,
    Updated_At = GETDATE()
WHERE Hotel_ID = 2;
GO

-- Verify
SELECT
    Hotel_ID,
    Hotel_Name,
    Hotel_City,
    Is_Active,
    Updated_At
FROM Hotel
WHERE Hotel_ID = 2;
GO

-- Now we can see only active hotels and inactive ones using 0 or 1
SELECT
    Hotel_ID,
    Hotel_Name,
    Hotel_City,
    Hotel_Star_Rating
FROM Hotel
WHERE Is_Active = 1;
GO

-- ============================================
-- OPERATION 3: HARD DELETE INSIDE TRANSACTION
-- A test booking was accidentally created during system testing with booking reference (BK-TEST-00001).
-- It has no payments and no service charges linked to it. 
-- It must be permanently removed from the database.
-- We wrap this in a transaction so that if anything goes wrong the delete is rolled back and no partial deletion occurs.
-- ============================================

-- First insert the test booking to delete
INSERT INTO Booking 
   (Guest_ID, Room_ID, Booking_Ref,   Booking_Date,  Check_In_Date, Check_Out_Date, Booking_Status, Booking_Channel, Number_of_Guest)
VALUES 
   (1,         1,     'BK-TEST-00001', '2026-05-01', '2026-05-10', '2026-05-12',    'Confirmed',    'Direct Website',              1);
GO

-- Verifying if it exists (USE THIS TO RE-VERIFY AFTER COMMITING TRANSACTION)
SELECT Booking_ID, Booking_Ref, Booking_Status
FROM Booking
WHERE Booking_Ref = 'BK-TEST-00001';
GO

-- Permanent delete
BEGIN TRANSACTION;

    DELETE FROM Booking
    WHERE Booking_Ref = 'BK-TEST-00001';

-- Verifying if it has been deleted
    SELECT COUNT(*) AS Main_Records
    FROM Booking
    WHERE Booking_Ref = 'BK-TEST-00001';

COMMIT TRANSACTION;
GO

-- ============================================
-- OPERATION 4: MERGE
-- Business Justification:
-- The reservations team maintains a staging table of new and updated guest records collected from a third party booking portal.
-- These must be synced into the main Guest table. 
-- New guests are inserted, existing guests are updated if their phone or nationality has changed. 
-- ============================================

-- Create the staging table
CREATE TABLE Guest_Staging (
    Staging_email        NVARCHAR(100) NOT NULL,
    Staging_first_name   NVARCHAR(20)  NOT NULL,
    Staging_last_name    NVARCHAR(20)  NOT NULL,
    Staging_phone        NVARCHAR(20)  NULL,
    Staging_nationality  NVARCHAR(50)  NULL,
    Staging_id_type      NVARCHAR(20)  NULL,
    Staging_id_number    NVARCHAR(50)  NULL,
    Staging_loyalty_tier NVARCHAR(20)  NOT NULL  DEFAULT 'None',
    Created_At           DATETIME      NOT NULL  DEFAULT GETDATE(),
    Updated_At           DATETIME      NOT NULL  DEFAULT GETDATE(),
);
GO

-- Insert data into staging table

INSERT INTO Guest_Staging (Staging_email, Staging_first_name,Staging_last_name,Staging_phone, Staging_nationality,Staging_id_type, Staging_id_number, Staging_loyalty_tier)
VALUES
-- Existing guest with updated phone number
('bolu.adeyemi@gmail.com',    'Bolu',  'Adeyemi', '+234 802 269 5688', 'Nigerian', 'Passport',    'A23456789', 'Silver'),

-- Existing guest with updated nationality
('william.harrison@gmail.com', 'William','Harrison','+44 7701 234567', 'French',   'Passport',    'GB8765432',   'Gold'),

-- Brand new guest from booking portal
('ibrahim.musa@gmail.com',     'Ibrahim','Musa',  '+234 817 103 4567', 'Nigerian', 'National ID', 'NG9988776',   'None'),

-- Brand new guest from booking portal
('priya.sharma@gmail.com',     'Priya', 'Sharma', '+91 657 614 3010',  'Indian',   'Passport',    'IN7654321',   'None');
GO

-- Run the MERGE
MERGE INTO Guest AS target
USING Guest_Staging AS source
    ON target.Email = source.Staging_email

-- When email matches update the record
WHEN MATCHED THEN
    UPDATE SET
        target.Phone             = source.Staging_phone,
        target.Nationality       = source.Staging_nationality,
        target.Loyalty_Tier      = source.Staging_loyalty_tier,
        target.Updated_At        = GETDATE()

-- When no match insert as new guest
WHEN NOT MATCHED BY TARGET THEN
    INSERT (First_Name, Last_Name, Email, Phone, Nationality, ID_Type, ID_Number, Loyalty_Tier)
    VALUES (
              source.Staging_first_name, source.Staging_last_name,
              source.Staging_email, source.Staging_phone,
              source.Staging_nationality, source.Staging_id_type,
              source.Staging_id_number, source.Staging_loyalty_tier);
GO

-- Verify MERGE result
SELECT
    Guest_ID,
    First_Name,
    Last_Name,
    Email,
    Phone,
    Nationality,
    Loyalty_Tier,
    Updated_At
FROM Guest
WHERE Email IN (
    'bolu.adeyemi@gmail.com',
    'william.harrison@gmail.com',
    'ibrahim.musa@gmail.com',
    'priya.sharma@gmail.com'
);
GO

-- Confirm total number of guest
SELECT COUNT(*) AS total_guests
FROM Guest;
GO

--  Delete staging table
DROP TABLE Guest_Staging;
GO



--=====================================
-- REVERTIMG THE NAIROBI LOUNGE TO IS_ACTIVE = 1
-- In order to ensure postive validation query
-- I used it for the soft delete example
-- ===================================

USE GrandStayDB;
GO

UPDATE Hotel
SET
    Is_Active  = 1,
    Updated_At = GETDATE()
WHERE Hotel_ID = 2;
GO