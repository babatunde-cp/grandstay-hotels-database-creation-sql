/* ============================================================
   TRANSACTION LAYER - BOOKINGS TABLE
   ============================================================
   These table handle the record guest needs and actions:
   Which room type is the guest is booking, 
   Check in and out date,
   and Requests.
   ============================================================ */
 
-- ------------------------------------------------------------
-- TABLE 4: Booking
-- Purpose: It is a physical asset of the business
-- It exists and operates regardless of whether a booking is made.
-- Design:  Hotel & Room table - foreign keys
-- Business Rules:
    -- Check out date must be greater than check in date
    -- Number of guest cannot be null
    -- Booking ref should be unique
-- ------------------------------------------------------------

CREATE TABLE Booking (
 -- Column Names          DataTypes                  Constraints
 Booking_ID               INT IDENTITY(1,1)          PRIMARY KEY,
 -- Links
 Guest_ID                 INT                        NOT NULL,
 Room_ID                  INT                        NOT NULL,
 -- Booking process
 Booking_Ref              NVARCHAR(20)               NOT NULL  UNIQUE,
 Booking_Date             DATE                   NOT NULL,
                                                     CHECK (Check_Out_Date > Check_In_Date),
 Check_In_Date            DATE                       NOT NULL,
 Check_Out_Date           DATE                       NOT NULL,
 Actual_Check_In          DATETIME                   NULL,
 Actual_Check_Out         DATETIME                   NULL,
 Booking_Status           NVARCHAR(20)               NOT NULL  DEFAULT 'Confirmed',
                                                     CHECK(Booking_Status IN('Confirmed','Checked In','Checked Out','Cancelled','No Show')),
 Booking_Channel          NVARCHAR(20)               NOT NULL,
                                                     CHECK(Booking_Channel IN('Direct Website','OTA','Walk In','Corporate','Travel Agent')),
 Number_of_Guest          INT                        NOT NULL  DEFAULT 1,
                                                     CHECK(Number_of_Guest >= 1),
 -- Guest actions
 Special_Requests         NVARCHAR(100)              NULL,
 Cancellation_Reason      NVARCHAR(100)              NULL,
 Assigned_Staff_Name      NVARCHAR(50)               NULL,
 Notes                    NVARCHAR(250)              NULL,
 -- Status
 Is_Active                BIT                        NOT NULL  DEFAULT 1,
 -- Audit
 Created_At               DATETIME                   NOT NULL  DEFAULT GETDATE(),
 Updated_At               DATETIME                   NOT NULL  DEFAULT GETDATE(),

 -- Foreign keys
 CONSTRAINT FK_Booking_Guest
    FOREIGN KEY (Guest_ID) REFERENCES Guest(Guest_ID),

CONSTRAINT FK_Booking_Room
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);
Print'Booking Table with 19 columns created'
GO