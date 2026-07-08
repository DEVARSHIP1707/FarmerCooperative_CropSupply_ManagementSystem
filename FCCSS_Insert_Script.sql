
                                            -- COOPERATIVE SOCIETIES
INSERT INTO COOPERATIVE_SOCIETY (CoopID, Name, RegNo, District, State, Phone) VALUES
(1, 'Amul Farmers Cooperative', 'GJ-COOP-001', 'Anand',       'Gujarat', '9876500001'),
(2, 'Krishna Agri Cooperative',  'GJ-COOP-002', 'Vadodara',    'Gujarat', '9876500002'),
(3, 'Narmada Kisan Society',      'MP-COOP-001', 'Narmadapuram','Madhya Pradesh','9876500003');

                                                     --    FARMERS 
INSERT INTO FARMER (FarmerID, AadhaarNo, Name, Phone, Village, Status) VALUES
(1,  '123456789012', 'Ramesh Patel',   '9900001111', 'Karamsad',   'Active'),
(2,  '234567890123', 'Suresh Desai',   '9900002222', 'Anklav',     'Active'),
(3,  '345678901234', 'Geeta Sharma',   '9900003333', 'Borsad',     'Active'),
(4,  '456789012345', 'Harish Verma',   '9900004444', 'Khambhat',   'Inactive'),
(5,  '567890123456', 'Priya Nair',     '9900005555', 'Petlad',     'Active'),
(6,  '678901234567', 'Mohan Joshi',    '9900006666', 'Umreth',     'Active'),
(7,  '789012345678', 'Anita Yadav',    '9900007777', 'Tarapur',    'Active'),
(8,  '890123456789', 'Vijay Kumar',    '9900008888', 'Padra',      'Active');

                                                  --   FARMER MEMBERSHIP 
INSERT INTO FARMER_MEMBERSHIP (MemberID, FarmerID, CoopID, EnrollDate, MemberFee, Status) VALUES
(1, 1, 1, '2022-04-01', 500.00,  'Active'),
(2, 2, 1, '2022-04-15', 500.00,  'Active'),
(3, 3, 1, '2022-05-01', 500.00,  'Active'),
(4, 4, 2, '2021-06-01', 600.00,  'Inactive'),
(5, 5, 2, '2023-01-10', 600.00,  'Active'),
(6, 6, 2, '2023-02-20', 600.00,  'Active'),
(7, 7, 3, '2023-03-05', 450.00,  'Active'),
(8, 8, 3, '2023-03-15', 450.00,  'Active');

                                                   --   CROP LOTS 
INSERT INTO CROP_LOT (LotID, FarmerID, CropName, Variety, QtyKg, HarvestDate, Season) VALUES
(1,  1, 'Wheat',   'Lok-1',     5000.00, '2024-03-10', 'Rabi'),
(2,  2, 'Rice',    'Basmati',   3000.00, '2024-10-15', 'Kharif'),
(3,  3, 'Cotton',  'BT Hybrid', 2000.00, '2024-11-01', 'Kharif'),
(4,  5, 'Maize',   'HQPM-1',   4500.00, '2024-10-20', 'Kharif'),
(5,  6, 'Wheat',   'GW-322',    6000.00, '2024-03-15', 'Rabi'),
(6,  7, 'Soybean', 'JS-335',    3500.00, '2024-10-05', 'Kharif'),
(7,  8, 'Rice',    'Sona Masuri',2500.00,'2024-10-25', 'Kharif'),
(8,  1, 'Wheat',   'Lok-1',     4000.00, '2025-03-08', 'Rabi'),
(9,  2, 'Maize',   'DHM-117',   3200.00, '2024-10-18', 'Kharif'),
(10, 3, 'Cotton',  'Bunny BT',  1800.00, '2024-11-10', 'Kharif');

                                                  --      QUALITY CHECK 
INSERT INTO QUALITY_CHECK (QCID, LotID, Grade, MoisturePct, Inspector, QCDate) VALUES
(1,  1,  'A',  12.50, 'Dinesh Shah',    '2024-03-11'),
(2,  2,  'B',  14.00, 'Rekha Mehta',    '2024-10-16'),
(3,  3,  'A',  10.80, 'Dinesh Shah',    '2024-11-02'),
(4,  4,  'A',  11.20, 'Rekha Mehta',    '2024-10-21'),
(5,  5,  'B',  13.50, 'Sunil Pandey',   '2024-03-16'),
(6,  6,  'C',  16.00, 'Sunil Pandey',   '2024-10-06'),
(7,  7,  'A',  11.80, 'Dinesh Shah',    '2024-10-26'),
(8,  8,  'A',  12.00, 'Rekha Mehta',    '2025-03-09'),
(9,  9,  'B',  13.80, 'Sunil Pandey',   '2024-10-19'),
(10, 10, 'A',  10.50, 'Dinesh Shah',    '2024-11-11');

                                                 --     PROCUREMENT
INSERT INTO PROCUREMENT (ProcureID, LotID, CoopID, ProcureDate, QtyKg, PricePerKg, TotalAmt) VALUES
(1,  1,  1, '2024-03-12', 5000.00, 22.50, 112500.00),
(2,  2,  1, '2024-10-17', 3000.00, 45.00, 135000.00),
(3,  3,  2, '2024-11-03', 2000.00, 60.00, 120000.00),
(4,  4,  2, '2024-10-22', 4500.00, 18.00,  81000.00),
(5,  5,  2, '2024-03-17', 6000.00, 21.00, 126000.00),
(6,  6,  3, '2024-10-07', 3500.00, 38.00, 133000.00),
(7,  7,  3, '2024-10-27', 2500.00, 42.00, 105000.00),
(8,  8,  1, '2025-03-10', 4000.00, 23.00,  92000.00),
(9,  9,  1, '2024-10-20', 3200.00, 17.50,  56000.00),
(10, 10, 2, '2024-11-12', 1800.00, 58.00, 104400.00);

                                            --   FARMER PAYMENT 
INSERT INTO FARMER_PAYMENT (PaymentID, ProcureID, FarmerID, GrossAmt, Deductions, NetPayable, PayDate, Mode) VALUES
(1,  1,  1, 112500.00,  2500.00, 110000.00, '2024-03-14', 'NEFT'),
(2,  2,  2, 135000.00,  3000.00, 132000.00, '2024-10-19', 'NEFT'),
(3,  3,  3, 120000.00,  2000.00, 118000.00, '2024-11-05', 'Cheque'),
(4,  4,  5,  81000.00,  1500.00,  79500.00, '2024-10-24', 'NEFT'),
(5,  5,  6, 126000.00,  2500.00, 123500.00, '2024-03-19', 'NEFT'),
(6,  6,  7, 133000.00,  3000.00, 130000.00, '2024-10-09', 'RTGS'),
(7,  7,  8, 105000.00,  2000.00, 103000.00, '2024-10-29', 'NEFT'),
(8,  8,  1,  92000.00,  1800.00,  90200.00, '2025-03-12', 'NEFT'),
(9,  9,  2,  56000.00,  1200.00,  54800.00, '2024-10-22', 'NEFT'),
(10, 10, 3, 104400.00,  2100.00, 102300.00, '2024-11-14', 'Cheque');

                                            --    WAREHOUSE 
INSERT INTO WAREHOUSE (WarehouseID, CoopID, Location, CapacityKg, Address) VALUES
(1, 1, 'Anand Central',   500000.00, 'Plot 12, GIDC, Anand, Gujarat'),
(2, 1, 'Anand East',      300000.00, 'Survey 45, Karamsad Rd, Anand'),
(3, 2, 'Vadodara Main',   400000.00, 'NH-48, Makarpura, Vadodara'),
(4, 3, 'Narmadapuram WH', 250000.00, 'Hoshangabad Rd, Narmadapuram, MP');

                                                 
                                                        --   INVENTORY 
INSERT INTO INVENTORY (InventoryID, WarehouseID, ProcureID, CropName, Grade, QtyAvailKg, ReceivedDate, ShelfDate) VALUES
(1,  1, 1,  'Wheat',   'A', 5000.00, '2024-03-13', '2024-09-13'),
(2,  1, 2,  'Rice',    'B', 3000.00, '2024-10-18', '2025-04-18'),
(3,  3, 3,  'Cotton',  'A', 2000.00, '2024-11-04', '2025-05-04'),
(4,  3, 4,  'Maize',   'A', 4500.00, '2024-10-23', '2025-04-23'),
(5,  3, 5,  'Wheat',   'B', 6000.00, '2024-03-18', '2024-09-18'),
(6,  4, 6,  'Soybean', 'C', 3500.00, '2024-10-08', '2025-04-08'),
(7,  4, 7,  'Rice',    'A', 2500.00, '2024-10-28', '2025-04-28'),
(8,  2, 8,  'Wheat',   'A', 4000.00, '2025-03-11', '2025-09-11'),
(9,  1, 9,  'Maize',   'B', 3200.00, '2024-10-21', '2025-04-21'),
(10, 3, 10, 'Cotton',  'A', 1800.00, '2024-11-13', '2025-05-13');

                                 --     LOGISTICS PARTNER 
INSERT INTO LOGISTICS_PARTNER (PartnerID, Name, ServiceRegion, GSTIN, Phone) VALUES
(1, 'Swift Agri Logistics',  'Gujarat',              '24AABCS1429B1Z5', '9811100001'),
(2, 'Central India Freight', 'Madhya Pradesh',       '23AACCC1234D1Z9', '9811100002'),
(3, 'Pan India Carriers',    'Gujarat, Maharashtra', '27AADCP5678E1Z3', '9811100003');

                                           --      VEHICLE 
INSERT INTO VEHICLE (VehicleID, PartnerID, VehicleType, CapacityKg, RegNo) VALUES
(1, 1, 'Mini Truck',  5000.00,  'GJ-01-AB-1234'),
(2, 1, 'Large Truck', 15000.00, 'GJ-01-CD-5678'),
(3, 2, 'Large Truck', 12000.00, 'MP-09-EF-9012'),
(4, 3, 'Container',   20000.00, 'MH-12-GH-3456'),
(5, 1, 'Mini Truck',  5000.00,  'GJ-01-IJ-7890');

                                              --   BUYER 
INSERT INTO BUYER (BuyerID, BizName, Type, Email, GSTIN) VALUES
(1, 'National Food Corp',      'Government', 'nfc@gov.in',          '07AAACN1234A1Z6'),
(2, 'AgroMart Pvt Ltd',        'Private',    'buy@agromart.com',    '19AABCA5678B2Z1'),
(3, 'Gujarat Mills Ltd',       'Industry',   'proc@gujaratmills.in','24AADCG9012C3Z4'),
(4, 'FreshEat Exports',        'Exporter',   'trade@fresheat.com',  '27AACFE3456D4Z7'),
(5, 'State Procurement Board', 'Government', 'spb@state.gov.in',    '24AABCS2345E5Z2');

                                           --   ORDER HEADER 
INSERT INTO ORDER_HEADER (OrderID, BuyerID, OrderDate, Status, DelivAddr, QtyOrdered) VALUES
(1, 1, '2024-04-01', 'Delivered',  'FCI Godown, Anand',           5000.00),
(2, 2, '2024-11-01', 'Delivered',  'AgroMart WH, Surat',          3000.00),
(3, 3, '2024-11-05', 'Processing', 'Gujarat Mills, Vadodara',     4500.00),
(4, 4, '2025-01-10', 'Pending',    'JNPT Export Terminal, Mumbai', 3500.00),
(5, 5, '2025-03-20', 'Confirmed',  'SPB Depot, Anand',            4000.00);

                                                 --     ORDER ITEM 
INSERT INTO ORDER_ITEM (OrderItemID, OrderID, InventoryID, QtyKg, PricePerKg, TotalAmt) VALUES
(1, 1, 1, 5000.00, 25.00, 125000.00),
(2, 2, 2, 3000.00, 50.00, 150000.00),
(3, 3, 4, 4500.00, 20.00,  90000.00),
(4, 4, 6, 3500.00, 42.00, 147000.00),
(5, 5, 8, 4000.00, 26.00, 104000.00);

                                                     --   TRANSPORT JOB 
INSERT INTO TRANSPORT_JOB (JobID, VehicleID, ProcureID, OrderID, SchedDate, SrcAddr, AmtPayable, Status) VALUES
(1, 1, 1, 1, '2024-03-14', 'Karamsad Farm, Anand',         4500.00,  'Completed'),
(2, 2, 2, 2, '2024-10-18', 'Anklav Farm, Anand',           6000.00,  'Completed'),
(3, 4, 3, 3, '2024-11-04', 'Borsad Farm, Anand',           8000.00,  'In Transit'),
(4, 3, 6, 4, '2024-10-08', 'Tarapur Farm, Narmadapuram',   7500.00,  'Completed'),
(5, 2, 8, 5, '2025-03-11', 'Karamsad Farm, Anand',         5500.00,  'Scheduled');

                                             --   CROP PRICE 
INSERT INTO CROP_PRICE (PriceID, CoopID, CropName, Grade, PricePerKg, EffectiveDate, SettleAdmin) VALUES
(1,  1, 'Wheat',   'A', 23.00, '2024-03-01', 'Ajay Bhatt'),
(2,  1, 'Wheat',   'B', 21.00, '2024-03-01', 'Ajay Bhatt'),
(3,  1, 'Rice',    'A', 47.00, '2024-10-01', 'Kavita Rao'),
(4,  1, 'Rice',    'B', 44.00, '2024-10-01', 'Kavita Rao'),
(5,  2, 'Cotton',  'A', 62.00, '2024-11-01', 'Naresh Tiwari'),
(6,  2, 'Cotton',  'B', 55.00, '2024-11-01', 'Naresh Tiwari'),
(7,  2, 'Maize',   'A', 19.00, '2024-10-01', 'Naresh Tiwari'),
(8,  3, 'Soybean', 'A', 40.00, '2024-10-01', 'Pradeep Singh'),
(9,  3, 'Soybean', 'C', 35.00, '2024-10-01', 'Pradeep Singh'),
(10, 1, 'Wheat',   'A', 24.00, '2025-03-01', 'Ajay Bhatt');

                                           --     SUBSIDY SCHEME 
INSERT INTO SUBSIDY_SCHEME (SchemeID, SchemeName, Type, StartDate, EligibleCrop) VALUES
(1, 'PM Fasal Bima Yojana',       'Insurance',       '2022-04-01', 'All'),
(2, 'MSP Bonus Scheme 2024',      'Price Support',   '2024-04-01', 'Wheat'),
(3, 'Kharif Input Subsidy',       'Input Support',   '2024-06-01', 'Rice'),
(4, 'Cotton Export Incentive',    'Export Benefit',  '2024-09-01', 'Cotton'),
(5, 'Soybean Cultivation Scheme', 'Cultivation Aid', '2024-07-01', 'Soybean');

                                       --     SUBSIDY DISBURSEMENT 
INSERT INTO SUBSIDY_DISBURSEMENT (DisburseID, SchemeID, FarmerID, ProcureID, AmtDisbursed, DisDate, RefNo, Status) VALUES
(1,  2, 1, 1,  5000.00, '2024-03-20', 'MSP-2024-001', 'Disbursed'),
(2,  3, 2, 2,  4500.00, '2024-10-25', 'KIS-2024-002', 'Disbursed'),
(3,  4, 3, 3,  6000.00, '2024-11-15', 'CEI-2024-003', 'Disbursed'),
(4,  1, 5, 4,  2000.00, '2024-11-01', 'PMFBY-2024-04','Pending'),
(5,  2, 6, 5,  6000.00, '2024-03-25', 'MSP-2024-005', 'Disbursed'),
(6,  5, 7, 6,  7000.00, '2024-10-15', 'SCS-2024-006', 'Disbursed'),
(7,  3, 8, 7,  3750.00, '2024-11-05', 'KIS-2024-007', 'Disbursed'),
(8,  2, 1, 8,  4000.00, '2025-03-18', 'MSP-2025-008', 'Pending');


