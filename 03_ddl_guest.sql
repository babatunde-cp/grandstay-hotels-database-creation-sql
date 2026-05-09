-- ------------------------------------------------------------
-- TABLE 2: Guest
-- Purpose: The visiting customer entity - Loyalty tier available on the platform
--          ('None', 'Silver', 'Gold', 'Platinum')
-- Design:  Independent table - no foreign keys
-- Business Rules:
--   - Email must be unique across all guest record
-- ------------------------------------------------------------

CREATE TABLE Guest  (
 -- Column Names          DataTypes                  Constraints
 Guest_ID                 INT IDENTITY(1,1)          PRIMARY KEY,
 First_Name               NVARCHAR(50)               NOT NULL,
 Last_Name                NVARCHAR(50)               NOT NULL,
 Email                    NVARCHAR(150)              NOT NULL  UNIQUE,
 Phone                    NVARCHAR(20)               NULL,
 Nationality              NVARCHAR(50)               NULL,
 DOB                      DATE                       NULL,
 ID_Type                  NVARCHAR(20)               NULL,
                                                     CHECK(ID_Type IN('Passport','National ID','Drivers License')),
 ID_Number                NVARCHAR(50)               NULL,
 Loyalty_Tier             NVARCHAR(20)               NOT NULL DEFAULT 'None',
                                                     CHECK(Loyalty_Tier IN('None', 'Silver', 'Gold', 'Platinum')),
 Loyalty_Point_Balance    INT                        NOT NULL  DEFAULT 0,
  -- Status
 Is_Active                BIT                        NOT NULL  DEFAULT 1,
 -- Audit
 Created_At               DATETIME                   NOT NULL  DEFAULT GETDATE(),
 Updated_At               DATETIME                   NOT NULL  DEFAULT GETDATE()
);
Print'Guest Table with 14 columns created'
GO