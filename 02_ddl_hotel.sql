/* ============================================================
   REFERENCE LAYER - MASTER DATA TABLES
   ============================================================
   These tables store foundational data that the rest of the
   schema depends on. They must be created first because child
   tables reference them via foreign keys.
 
   Order of creation:
     1. Hotel          (Independent)
     2. Guest          (Independent)
   ============================================================ */
 
-- ------------------------------------------------------------
-- TABLE 1: Hotel
-- Purpose: Unique ID
-- Design:  Independent table - no foreign keys
-- ------------------------------------------------------------
CREATE TABLE Hotel (
 -- Column Names          DataTypes                  Constraints
 Hotel_ID                 INT IDENTITY(1,1)          PRIMARY KEY,
 Hotel_Name               NVARCHAR(100)              NOT NULL,
 Hotel_City               NVARCHAR(50)               NOT NULL,
 Hotel_Country            NVARCHAR(50)               NOT NULL,
 Hotel_Star_Rating        INT                        NOT NULL,
                                                     CHECK (Hotel_Star_Rating IN (3,4,5)),
 -- Status
 Is_Active                BIT                        NOT NULL  DEFAULT 1,
 -- Audit
 Created_At               DATETIME                   NOT NULL  DEFAULT GETDATE(),
 Updated_At               DATETIME                   NOT NULL  DEFAULT GETDATE()
);
Print'Hotel Table with 8 columns created'
GO