/* ============================================================
   GRANDSTAY HOTELS & RESORTS - DATABASE CREATION
   ============================================================
   Purpose: Design a fully normalised relational database that replaces Excel workbook
   Author:  Babatunde Kareem
   Date:    30 April 2026

    Database Structure:
   - 6 Core Tables across four layers
   - Reference layer    : Hotel, Guest
   - Operations layer   : Room
   - Transaction layer  : Booking
   - Detail Data layer  : Service_Charge, Payment

   - Full referential integrity with named foreign keys
   - Business rule enforcement via CHECK constraints
   - Soft delete pattern with Is_Active flags
   - Full audit trail with Created_At / Updated_At timestamps
   - Strategic non-clustered indexes for query performance
 
   Design Principles:
   - Third Normal Form (3NF)
   - No redundant or derived data
   - Enforced referential integrity
   - Scalable, real-world architecture
   ============================================================ */


-- Drop database if it already exists (clean start)
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'GrandStayDB')
BEGIN
    ALTER DATABASE GrandStayDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE GrandStayDB;
END
GO

-- Create the database
CREATE DATABASE GrandStayDB;
GO

-- Switch into the database
USE GrandStayDB;
GO