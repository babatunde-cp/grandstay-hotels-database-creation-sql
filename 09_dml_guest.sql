-- 2: INSERT GUESTS (20 Guests)

 INSERT INTO Guest (First_Name, Last_Name, Email, Phone, Nationality, DOB, ID_Type, ID_Number, Loyalty_Tier, Loyalty_Point_Balance)
   VALUES
    ('Felix',       'Johnson',     'felix.johnson@gmail.com',        '+234 801 234 5678',   'Nigerian',  '1990-03-15', 'Passport',         'A12345678',   'None',        0),
    ('Bolu',        'Adeyemi',     'bolu.adeyemi@gmail.com',         '+234 802 345 6789',   'Nigerian',  '1985-01-20', 'Passport',         'A23456789',   'Silver',   1200),
    ('William',     'Harrison',    'william.harrison@gmail.com',     '+44 7701 234567',     'British',   '1980-07-04', 'Passport',         'GB8765432',   'Gold',     5100),
    ('Catherine',   'Njoroge',     'catherine.njoroge@gmail.com',    '+254 715 678 901',    'Kenyan',    '1980-02-23', 'Passport',         'KE0987654',   'Platinum', 9800),
    ('Khalid',      'Al-Mansoori', 'khalid.almansoori@gmail.com',    '+971 505 678 901',    'Emirati',   '1975-09-08', 'Passport',         'UAE1123456',  'Platinum', 9200),
    ('Ayomide',     'Kareem',      'ayomide.kareem@gmail.com',       '+234 803 456 7890',   'Nigerian',  '1982-02-28', 'Passport',         'A34567890',   'Gold',     4200),
    ('Kofi',        'Asante',      'kofi.asante@gmail.com',          '+233 245 678 901',    'Ghanaian',  '1989-04-25', 'National ID',      'GH5567892',   'Silver',   2100),
    ('Fatima',      'Al-Rashid',   'fatima.alrashid@gmail.com',      '+971 502 345 678',    'Emirati',   '1988-07-22', 'National ID',      'UAE8872341',  'None',        0),
    ('Aisha',       'Malik',       'aisha.malik@gmail.com',          '+971 504 567 890',    'Pakistani', '1986-10-19', 'Passport',         'PK1234567',   'Gold',     3800),
    ('Mohammed',    'Al-Farsi',    'mohammed.alfarsi@gmail.com',     '+971 503 456 789',    'Emirati',   '1991-06-17', 'Passport',         'UAE9983421',  'Silver',   1500),
    ('James',       'Thornton',    'james.thornton@gmail.com',       '+44 7700 123456',     'British',   '1995-11-08', 'Passport',         'GB9876543',   'None',        0),
    ('Nurudeen',    'Jamal',       'nuru.jamal@gmail.com',           '+234 804 567 8901',   'Nigerian',  '1978-06-15', 'Passport',         'A45678901',   'Platinum', 8500),
    ('Sophie',      'Laurent',     'sophie.laurent@gmail.com',       '+33 612 345 678',     'French',    '1993-12-03', 'Passport',         'FR1234567',   'Silver',   1800),
    ('Grace',       'Wanjiku',     'grace.wanjiku@gmail.com',        '+254 713 456 789',    'Kenyan',    '1994-08-11', 'Passport',         'KE8765432',   'Silver',   2400),
    ('Amara',       'Mensah',      'amara.mensah@gmail.com',         '+233 244 567 890',    'Ghanaian',  '1992-05-30', 'National ID',      'GH4456781',   'None',        0),
    ('David',       'Kimani',      'david.kimani@gmail.com',         '+254 712 345 678',    'Kenyan',    '1987-09-14', 'Drivers License',  'KE7654321',   'None',        0),
    ('Elizabeth',   'Pemberton',   'elizabeth.pemberton@gmail.com',  '+44 7702 345678',     'British',   '1972-04-17', 'Passport',         'GB7654321',   'Platinum',11000),
    ('Kwame',       'Boateng',     'kwame.boateng@gmail.com',        '+233 247 890 123',    'Ghanaian',  '1977-12-05', 'Drivers License',  'GH7789014',   'Platinum', 7800),
    ('Ama',         'Owusu',       'ama.owusu@gmail.com',            '+233 246 789 012',    'Ghanaian',  '1990-03-22', 'Drivers License',  'GH6678903',   'Gold',     4600),
    ('Samuel',      'Ochieng',     'samuel.ochieng@gmail.com',       '+254 714 567 890',    'Kenyan',    '1983-11-30', 'Passport',         'KE9876543',   'Gold',     3500)
   PRINT '20 guests inserted'
 GO