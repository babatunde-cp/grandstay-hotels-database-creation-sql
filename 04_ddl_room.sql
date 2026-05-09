/* ============================================================
   OPERATIONS LAYER - ACTIVE TABLE
   ============================================================
   These tables represent the product itself - Rooms
   It forms the operational core of GrandStay.
   ============================================================ */
 
-- ------------------------------------------------------------
-- TABLE 3: Room
-- Purpose: It is a physical asset of the business
-- It exists and operates regardless of whether a booking is made.
-- Design:  Hotel table - foreign key
-- Business Rules:
    -- A room must belong to one hotel
    -- One room equals One booking
-- ------------------------------------------------------------

CREATE TABLE Room (
 -- Column Names          DataTypes                  Constraints
 Room_ID                  INT IDENTITY(1,1)          PRIMARY KEY,
 -- Links
 Hotel_ID                 INT                        NOT NULL,
 -- Room info
 Room_Number              NVARCHAR(10)               NOT NULL,
 Room_Type                NVARCHAR(20)               NOT NULL,
                                                     CHECK(Room_Type IN('Standard','Superior','Deluxe','Suite','Presidential')),
 Floor                    INT                        NOT NULL,
 Max_Occupancy            INT                        NOT NULL,
                                                     CHECK(Max_Occupancy > 0),
 Bed_Type                 NVARCHAR(20)               NOT NULL,
                                                     CHECK(Bed_Type IN('King','Queen','Twin','Single')),
 Room_Rate_Per_Night      DECIMAL(10,2)              NOT NULL 
                                                     CHECK(Room_Rate_Per_Night > 0),                                              
 -- Status
 Is_Active                BIT                        NOT NULL  DEFAULT 1,
 -- Audit
 Created_At               DATETIME                   NOT NULL  DEFAULT GETDATE(),
 Updated_At               DATETIME                   NOT NULL  DEFAULT GETDATE(),

 -- Foreign key
 CONSTRAINT FK_Room_Hotel
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID),

-- Room Number must be Unique per Hotel
CONSTRAINT UQ_Room_HotelRoom
    UNIQUE (Hotel_ID,Room_Number)
);
Print'Room Table with 10 columns created'
GO