-- ------------------------------------------------------------
-- TABLE 6: Payment
-- Purpose: Records every payments made in relation to Booking table
-- Design:  Booking table - foreign key
-- Business Rules:
    -- Every booking must have a payment record
    -- A single booking can have multiple payments
-- ------------------------------------------------------------

CREATE TABLE Payment (
 -- Column Names          DataTypes                  Constraints
 Payment_ID               INT IDENTITY(1,1)          PRIMARY KEY,
 -- Link
 Booking_ID               INT                        NOT NULL,
 -- Monetary Details
 Payment_Method           NVARCHAR(20)               NOT NULL,
                                                     CHECK (Payment_Method IN ('Cash','Card','Bank Transfer','Mobile Money','Corporate Account')),
 Payment_Date             DATETIME                   NOT NULL DEFAULT GETDATE(),
 Payment_Status           NVARCHAR(20)               NOT NULL DEFAULT 'Pending',
                                                     CHECK (Payment_Status IN ('Pending','Partially Paid','Paid','Refunded')),
 Grand_Total              DECIMAL(10,2)              NOT NULL,
                                                     CHECK(Grand_Total > 0),
 Amount_Paid              DECIMAL(10,2)              NOT NULL DEFAULT 0,
                                                     CHECK(Amount_Paid >= 0),
 Balance_Due              DECIMAL(10,2)              NOT NULL DEFAULT 0,
                                                     CHECK(Balance_Due >= 0),
 Discount_Applied         NVARCHAR(20)               NULL,
 Discount_Amount          DECIMAL(10,2)              NOT NULL DEFAULT 0,
 Tax_Amount               DECIMAL(10,2)              NOT NULL DEFAULT 0,
 -- Status
 Is_Active                BIT                        NOT NULL DEFAULT 1,
 -- Audit
 Created_At               DATETIME                   NOT NULL DEFAULT GETDATE(),
 Updated_At               DATETIME                   NOT NULL DEFAULT GETDATE(),

 -- Foreign Keys
 CONSTRAINT FK_Payment_Booking
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID),
);
Print'Payment Table with 14 columns created'
GO