-- ============================================
-- INSERT BOOKINGS
-- ============================================
-- 68 bookings are inserted here covering all 6 hotels, all 20 guests and a mix of booking statuses including Confirmed, Checked In, Checked Out, Cancelled and No Show. 
-- Booking references are unique as enforced by the UQ_Booking_Ref constraint.
-- The nights_stayed column from the Excel file has been deliberately excluded and will be calculated at query time using DATEDIFF.


USE GrandStayDB;
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- JANUARY 2025 BOOKINGS
-------------------------

(16,  5,  'BK-2025-00001', '2025-01-05','2025-01-10', '2025-01-15', '2025-01-10 14:00', '2025-01-15 11:00','Checked Out', 'Direct Website',2, 'Late check-out requested', NULL, 'Emeka Nwosu', 'VIP guest handle with care'),
(13,  13, 'BK-2025-00002', '2025-01-08','2025-01-12', '2025-01-16', '2025-01-12 15:30', '2025-01-16 10:30','Checked Out', 'Corporate',     1, NULL,                       NULL, 'James Obi',                           NULL),
(7,   17, 'BK-2025-00003', '2025-01-10','2025-01-20', '2025-01-25', '2025-01-20 13:00', '2025-01-25 11:00','Checked Out', 'OTA',           2, 'Extra pillows requested',  NULL, 'Sara Ahmed',                          NULL),
(1,   26, 'BK-2025-00004', '2025-01-15','2025-01-18', '2025-01-20', '2025-01-18 16:00', '2025-01-20 10:00','Checked Out', 'Walk In',       1, NULL,                       NULL, 'Kemi Ade',                            NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- FEBRUARY 2025 BOOKINGS
-------------------------
(14, 24, 'BK-2025-00005', '2025-02-01','2025-02-05', '2025-02-10', '2025-02-05 13:00', '2025-02-10 11:00','Checked Out', 'Direct Website', 2,  NULL,                      NULL, 'Ama Boateng',                          NULL),
(6,  3,  'BK-2025-00006', '2025-02-05','2025-02-08', '2025-02-12', '2025-02-08 15:00', '2025-02-12 10:00','Checked Out', 'OTA',            2,  'High floor preferred',    NULL, 'Emeka Nwosu',                          NULL),
(3,  11, 'BK-2025-00007', '2025-02-10','2025-02-14', '2025-02-18', '2025-02-14 14:00', '2025-02-18 11:00','Checked Out', 'OTA',            1,  NULL,                      NULL, 'James Obi',                            NULL),
(17, 20, 'BK-2025-00008', '2025-02-12','2025-02-15', '2025-02-20', '2025-02-15 12:00', '2025-02-20 11:00','Checked Out', 'Corporate',      4,  'Butler service required', NULL, 'Sara Ahmed', 'VIP booking corporate client'),
(20,  9, 'BK-2025-00009', '2025-02-18','2025-02-22', '2025-02-27', '2025-02-22 14:30', '2025-02-27 11:00','Checked Out', 'Travel Agent',   3, 'Airport transfer required',NULL, 'Peter Kamau',      'Regular platinum guest');
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- MARCH 2025 BOOKINGS
-------------------------
(4,  16, 'BK-2025-00010', '2025-03-15','2025-03-20', '2025-03-25',  NULL,               NULL,             'Cancelled',   'Direct Website', 2,  NULL,                        'Change of travel plans', 'Kemi Ade',               NULL),
(15, 8,  'BK-2025-00011', '2025-03-01','2025-03-05', '2025-03-10', '2025-03-05 14:00', '2025-03-10 11:00','Checked Out', 'Travel Agent',   2,  NULL,                         NULL,                    'Peter Kamau',            NULL),
(9,  22, 'BK-2025-00012', '2025-03-05','2025-03-08', '2025-03-12', '2025-03-08 15:30', '2025-03-12 10:30','Checked Out', 'OTA',            2,  'Vegetarian meals requested', NULL,                    'Ama Boateng',            NULL),
(16, 4,  'BK-2025-00013', '2025-03-10','2025-03-15', '2025-03-20', '2025-03-15 13:00', '2025-03-20 11:00','Checked Out', 'Direct Website', 3,  'Late check-out requested',   NULL,                    'Emeka Nwosu',     'VIP guest');
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- APRIL 2025 BOOKINGS
-------------------------
(2,  27,  'BK-2025-00014', '2025-04-12','2025-04-15', '2025-04-18', '2025-04-15 16:00', '2025-04-18 10:00','Checked Out', 'Walk In',        1,  NULL,                        NULL,  'Kemi Ade',                                NULL),
(5,  21,  'BK-2025-00015', '2025-04-15','2025-04-20', '2025-04-25', NULL,               NULL,              'No Show',     'OTA',            2,  NULL,                        NULL,  'Peter Kamau',          'Guest did not show up'),
(13,  14, 'BK-2025-00016', '2025-04-01','2025-04-05', '2025-04-10', '2025-04-05 14:00', '2025-04-10 11:00','Checked Out', 'Corporate',      2,  NULL,                        NULL,  'James Obi',                               NULL),
(8,   18, 'BK-2025-00017', '2025-04-05','2025-04-10', '2025-04-15', '2025-04-10 15:00', '2025-04-15 11:00','Checked Out', 'Travel Agent',   2,  'Sea view room requested',   NULL,  'Sara Ahmed',                              NULL),
(19,  25, 'BK-2025-00018', '2025-04-08','2025-04-12', '2025-04-18', '2025-04-12 13:00', '2025-04-18 11:00','Checked Out', 'Direct Website', 4,  'Airport transfer required', NULL,  'Ama Boateng', 'Platinum guest regular visitor');
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- MAY 2025 BOOKINGS
-------------------------
(5,  6,  'BK-2025-00019', '2025-05-10','2025-05-14', '2025-05-17', '2025-05-14 16:00', '2025-05-17 10:00','Checked Out', 'Walk In',        1,  NULL,                        NULL,                'Peter Kamau',                      NULL),
(10, 12, 'BK-2025-00020', '2025-05-12','2025-05-18', '2025-05-22', NULL,               NULL,              'Cancelled',   'OTA',            2,  NULL,                        'Medical emergency', 'James Obi',                        NULL),
(18, 5,  'BK-2025-00021', '2025-05-01','2025-05-05', '2025-05-10', '2025-05-05 14:00', '2025-05-10 11:00','Checked Out', 'Corporate',      2, 'Butler service required',    NULL,                'Emeka Nwosu',    'Corporate VIP client'),
(12, 28, 'BK-2025-00022', '2025-05-05','2025-05-08', '2025-05-12', '2025-05-08 15:00', '2025-05-12 10:00','Checked Out', 'Direct Website', 2,  NULL,                        NULL,                'Kemi Ade',                         NULL),
(10, 12, 'BK-2025-00023', '2025-05-10','2025-05-14', '2025-05-18', '2025-05-14 14:00', '2025-05-18 11:00','Checked Out', 'OTA',            1,  NULL,                        NULL,                'James Obi',                        NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- JUNE 2025 BOOKINGS
-------------------------
(4,  16, 'BK-2025-00024', '2025-06-12','2025-06-15', '2025-06-18', '2025-06-15 16:00', '2025-06-18 10:00','Checked Out', 'Walk In',        2, NULL,                        NULL, 'Sara Ahmed',                    NULL),
(11, 9,  'BK-2025-00025', '2025-06-15','2025-06-20', '2025-06-25', '2025-06-20 13:00', '2025-06-25 11:00','Checked Out', 'Travel Agent',   3, 'Airport transfer required', NULL, 'Peter Kamau',                   NULL),
(16, 24, 'BK-2025-00026', '2025-06-01','2025-06-05', '2025-06-10', '2025-06-05 14:00', '2025-06-11 11:00','Checked Out', 'Direct Website', 2, 'Late check-out requested',  NULL, 'Ama Boateng',             'VIP guest'),
(6,  2,  'BK-2025-00027', '2025-06-05','2025-06-08', '2025-06-12', '2025-06-08 15:00', '2025-06-12 10:00','Checked Out', 'OTA',            2, NULL,                        NULL, 'Emeka Nwosu',                    NULL),
(1,  11, 'BK-2025-00028', '2025-06-10','2025-06-14', '2025-06-18', '2025-06-14 14:00', '2025-06-18 11:00','Checked Out', 'OTA',            1, NULL,                        NULL, 'James Obi',                      NULL),
(2,  6,  'BK-2025-00029', '2025-06-15','2025-06-20', '2025-06-25', NULL,               NULL,              'No Show',     'Travel Agent',   2, NULL,                        NULL, 'Peter Kamau', 'Guest did not show up');
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
---------------------------------
-- JULY 2025 BOOKINGS
---------------------------------
(14, 19, 'BK-2025-00030', '2025-06-21','2025-07-05', '2025-07-09', '2025-07-05 13:00', '2025-07-09 11:00','Checked Out', 'Corporate',        3, 'Butler service required',  NULL,       'Sara Ahmed',              NULL),
(17, 3,  'BK-2025-00031', '2025-07-01','2025-07-05', '2025-07-10', '2025-07-05 14:00', '2025-07-10 11:00','Checked Out', 'Direct Website',   2, NULL,                           NULL,   'Emeka Nwosu',      'VIP guest'),
(11, 29, 'BK-2025-00032', '2025-07-05','2025-07-10', '2025-07-16', '2025-07-11 13:00', '2025-07-16 11:00','Checked Out', 'Corporate',        3, NULL,                           NULL,   'Kemi Ade',                NULL),
(7,  13, 'BK-2025-00033', '2025-07-18','2025-07-20', '2025-07-27', '2025-07-20 13:00', '2025-07-27 11:00','Checked Out', 'OTA',              2, 'Extra pillows requested',      NULL,   'James Obi',               NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
---------------------------------
-- AUGUST 2025 BOOKINGS
---------------------------------
(3,  17, 'BK-2025-00034', '2025-07-27','2025-08-10', '2025-08-18', '2025-08-10 16:00', '2025-08-15 10:00','Checked Out', 'Direct Website',   1, NULL,                           NULL,   'Sara Ahmed',                  NULL),
(20, 10, 'BK-2025-00035', '2025-08-01','2025-08-03', '2025-08-10', '2025-08-03 16:00', '2025-08-11 10:00','Checked Out', 'Travel Agent',     4, 'Airport transfer required',    NULL,   'Peter Kamau',     'Platinum guest'),
(15, 23, 'BK-2025-00036', '2025-08-10','2025-08-10', '2025-08-11', '2025-08-10 16:00', '2025-08-11 10:00','Checked Out', 'Walk In',          2, NULL,                           NULL,   'Ama Boateng',                 NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
---------------------------------
-- SEPTEMBER 2025 BOOKINGS
---------------------------------
(8,  1,  'BK-2025-00037', '2025-09-01','2025-09-05', '2025-09-10', NULL,               NULL,              'Cancelled',   'OTA',              2, NULL,                           'Change of travel plans', 'Emeka Nwosu', NULL),
(12, 6,  'BK-2025-00038', '2025-09-10','2025-09-15', '2025-09-18', '2025-09-15 14:00', '2025-09-18 11:00','Checked Out', 'Walk In',          1, NULL,                           NULL,                     'Emeka Nwosu', NULL),
(18, 15, 'BK-2025-00039', '2025-09-21','2025-09-25', '2025-09-29', '2025-09-25 14:00', '2025-09-30 15:00','Checked Out', 'Corporate',        2, 'Late check-out requested',     NULL,                     'James Obi',   NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
---------------------------------
-- OCTOBER 2025 BOOKINGS
---------------------------------
(19, 10, 'BK-2025-00040', '2025-09-30','2025-10-02', '2025-10-05', NULL,               NULL,              'No Show',     'Direct Website',   2, 'Decoration in room',           NULL,                     'Sara Ahmed',   'Guest did not show up'),
(12, 3,  'BK-2025-00041', '2025-10-01','2025-10-05', '2025-10-10', '2025-10-05 14:00', '2025-10-12 09:00','Checked Out', 'Direct Website',   2, NULL,                           NULL,                     'Emeka Nwosu',              'VIP guest'),
(6,  19, 'BK-2025-00042', '2025-10-05','2025-10-10', '2025-10-15', '2025-10-10 20:00', '2025-10-15 13:00','Checked Out', 'Corporate',        3, NULL,                           NULL,                     'Kemi Ade',                        NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
----------------------------
-- NOVEMBER 2025 BOOKINGS
----------------------------
(16, 24, 'BK-2025-00043', '2025-11-01','2025-11-05', '2025-11-10', '2025-11-05 14:00', '2025-11-11 11:00','Checked Out', 'Direct Website', 2, 'Late check-out requested',  NULL, 'Ama Boateng',             'VIP guest'),
(6,  2,  'BK-2025-00044', '2025-11-05','2025-11-08', '2025-11-12', '2025-11-08 15:00', '2025-11-12 10:00','Checked Out', 'OTA',            2, NULL,                        NULL, 'Emeka Nwosu',                    NULL),
(10, 12, 'BK-2025-00045', '2025-11-12','2025-11-18', '2025-11-22', NULL,               NULL,              'Cancelled',   'OTA',            2, NULL,                        'Medical emergency', 'James Obi',       NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
---------------------------
-- DECEMBER 2025 BOOKINGS
---------------------------
(12, 7,  'BK-2025-00046', '2025-11-23','2025-12-02', '2025-12-08', '2025-12-02 16:00', '2025-12-08 11:30','Checked Out', 'Walk In' ,       1, NULL,                           NULL, 'Emeka Nwosu',                           NULL),
(8,  15, 'BK-2025-00047', '2025-11-29','2025-12-05', '2025-12-10', '2025-12-05 14:00', '2025-12-10 10:00','Checked Out', 'Corporate',      2, 'Late check-out requested',     NULL, 'James Obi',                             NULL),
(9,  11, 'BK-2025-00048', '2025-12-05','2025-12-10', '2025-12-15', '2025-12-10 12:00', '2025-12-15 16:00','Checked Out', 'Direct Website', 2, 'Christmas decoration in room', NULL, 'Sara Ahmed',        'Festive season booking'),
(5,  12, 'BK-2025-00049', '2025-12-21','2025-12-22', '2025-12-28', '2025-12-22 16:00', '2025-12-28 11:00','Checked Out', 'Walk In' ,       1, NULL,                           NULL, 'Emeka Nwosu',                           NULL),
(8,  4,  'BK-2025-00050', '2025-12-22','2025-12-23', '2025-12-30', '2025-12-23 14:00', '2025-12-30 13:00','Checked Out', 'Corporate',      2, 'Late check-out requested',     NULL, 'James Obi',                             NULL),
(6,  11, 'BK-2025-00051', '2025-12-22','2025-12-24', '2025-12-30', '2025-12-24 12:00', '2025-12-30 16:00','Checked Out', 'Direct Website', 2, 'Christmas decoration in room', NULL, 'Sara Ahmed',        'Festive season booking');
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- JANUARY 2026 BOOKINGS
-------------------------

(16,  5,  'BK-2026-00052', '2026-01-05','2026-01-10', '2026-01-15', '2026-01-10 14:00', '2026-01-15 11:00','Checked Out', 'Direct Website',2, 'Late check-out requested', NULL, 'Emeka Nwosu', 'VIP guest handle with care'),
(13,  13, 'BK-2026-00053', '2026-01-08','2026-01-12', '2026-01-16', '2026-01-12 15:30', '2026-01-16 10:30','Checked Out', 'Corporate',     1, NULL,                       NULL, 'James Obi',                           NULL),
(7,   17, 'BK-2026-00054', '2026-01-10','2026-01-20', '2026-01-25', '2026-01-20 13:00', '2026-01-25 11:00','Checked Out', 'OTA',           2, 'Extra pillows requested',  NULL, 'Sara Ahmed',                          NULL),
(1,   26, 'BK-2026-00055', '2026-01-15','2026-01-18', '2026-01-20', '2026-01-18 16:00', '2026-01-20 10:00','Checked Out', 'Walk In',       1, NULL,                       NULL, 'Kemi Ade',                            NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- FEBRUARY 2026 BOOKINGS
-------------------------
(20, 9,  'BK-2026-00056', '2026-02-03','2026-02-07', '2026-02-11', '2026-02-07 14:30', '2026-02-11 12:00','Checked Out', 'Travel Agent',   3, 'Airport transfer required',NULL, 'Peter Kamau',      'Regular platinum guest'),
(14, 24, 'BK-2026-00057', '2026-02-07','2026-02-10', '2026-02-15', '2026-02-10 12:40', '2026-02-15 11:30','Checked Out', 'Direct Website', 2,  NULL,                      NULL, 'Ama Boateng',                          NULL),
(6,  3,  'BK-2026-00058', '2026-02-18','2026-02-21', '2026-02-25', '2026-02-21 19:00', '2026-02-25 10:00','Checked Out', 'OTA',            2, 'High floor preferred',    NULL, 'Emeka Nwosu',                           NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- MARCH 2026 BOOKINGS
-------------------------
(4,  16, 'BK-2026-00059', '2026-03-01','2026-03-02', '2026-03-05',  NULL,               NULL,             'Cancelled',   'Direct Website', 2,  NULL,                        'Change of travel plans', 'Kemi Ade',               NULL),
(15, 8,  'BK-2026-00060', '2026-03-05','2026-03-05', '2026-03-10', '2026-03-05 14:00', '2026-03-10 11:00','Checked Out', 'Walk In',        2,  NULL,                         NULL,                    'Peter Kamau',            NULL),
(9,  23, 'BK-2026-00061', '2026-03-06','2026-03-08', '2026-03-12', '2026-03-08 15:30', '2026-03-12 10:30','Checked Out', 'OTA',            2,  'Vegetarian meals requested', NULL,                    'Ama Boateng',            NULL),
(16, 4,  'BK-2026-00062', '2026-03-21','2026-03-25', '2026-03-30', '2026-03-25 13:00', '2026-03-30 11:00','Checked Out', 'Direct Website', 3,  'Late check-out requested',   NULL,                    'Emeka Nwosu',     'VIP guest');
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- APRIL 2026 BOOKINGS
-------------------------
(2,  27, 'BK-2026-00063', '2026-04-12','2026-04-15', '2026-04-18', '2026-04-15 21:00', '2026-04-18 15:00','Checked Out', 'Walk In',        1,  NULL,                        NULL,  'Kemi Ade',                        NULL),
(5,  21, 'BK-2026-00064', '2026-04-15','2026-04-20', '2026-04-25', NULL,               NULL,              'No Show',     'OTA',            2,  NULL,                        NULL,  'Peter Kamau',  'Guest did not show up'),
(13, 14, 'BK-2026-00065', '2026-04-19','2026-04-23', '2026-04-26', '2026-04-23 19:00', '2026-04-26 18:00','Checked Out', 'Corporate',      2,  NULL,                        NULL,  'James Obi',                       NULL),
(8,  18, 'BK-2026-00066', '2026-04-25','2026-04-27', '2026-04-30', '2026-04-27 12:00', '2026-04-30 11:00','Checked Out', 'Travel Agent',   2,  'Sea view room requested',   NULL,  'Sara Ahmed',                      NULL);
GO

INSERT INTO Booking (Guest_ID,Room_ID,Booking_Ref,Booking_Date,Check_In_Date,Check_Out_Date,Actual_Check_In,Actual_Check_Out,Booking_Status,Booking_Channel,Number_of_Guest,Special_Requests,Cancellation_Reason,Assigned_Staff_Name,Notes)
VALUES
-------------------------
-- MAY 2026 BOOKINGS
-------------------------
(18, 15, 'BK-2026-00067', '2026-05-01','2026-05-05', '2026-05-12', '2026-05-05 14:00', NULL,'Checked In', 'Corporate',      2, 'Late check-out requested',   NULL, 'James Obi', 'Guest currently in residence'),
(19, 10, 'BK-2026-00068', '2026-05-03','2026-05-10', '2026-05-25', NULL,               NULL,'Confirmed',  'Direct Website', 2, 'High floor requested',       NULL, 'Sara Ahmed',                          NULL);
GO

PRINT '68 bookings inserted across all hotels';