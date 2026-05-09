/* ============================================================
   DETAIL DATA LAYER - SERVICE CHARGE & PAYMENT TABLE
   ============================================================
   These tables are the financial side of the business:
   Which includes transaction records, How guest make payment
   and other commercial related activities of the hotel.
   They record details that only exist as children of a Booking.
   ============================================================ */
 
-- ------------------------------------------------------------
-- TABLE 5: Service_Charge
-- Purpose: It represents a single service consumed during a stay.
-- Design:  Booking table - foreign key
-- Business Rules:
    -- Service Cost cannot be null
    -- A Booking can use multiple services
-- ------------------------------------------------------------

CREATE TABLE Service_Charge (
 -- Column Names          DataTypes                  Constraints
 Service_ID               INT IDENTITY(1,1)          PRIMARY KEY,
 -- Link
 Booking_ID               INT                        NOT NULL,
 -- Details
 Service_Name             NVARCHAR(100)               NOT NULL,
 Service_Used             NVARCHAR(50)               NOT NULL,
                                                     CHECK(Service_Used IN('Spa','Airport Transfer','Minibar','Food and Beverages')),
 Service_Date             DATETIME                   NOT NULL,
 Service_Cost             DECIMAL(12,2)              NOT NULL,
                                                     CHECK(Service_Cost > 0),
 -- Status
 Is_Active                BIT                        NOT NULL DEFAULT 1,
 -- Audit
 Created_At               DATETIME                   NOT NULL DEFAULT GETDATE(),
 Updated_At               DATETIME                   NOT NULL DEFAULT GETDATE(),


 -- Foreign Key
    CONSTRAINT FK_Service_Charge_Booking
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);
Print'Service Charge Table with 9 columns created'
GO

SELECT * FROM Service_Charge