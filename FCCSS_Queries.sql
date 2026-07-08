


--1.  Active Farmers with Cooperative Society Name
--To view all active farmers along with the cooperative society they belong to
SELECT f.FarmerID, f.Name AS FarmerName, f.Village,
       c.Name AS CoopName, c.District
FROM   FARMER f
JOIN   FARMER_MEMBERSHIP fm ON f.FarmerID = fm.FarmerID
JOIN   COOPERATIVE_SOCIETY c ON fm.CoopID = c.CoopID
WHERE  f.Status = 'Active' AND fm.Status = 'Active'
ORDER BY c.Name, f.Name;


--2.  Count of Farmers per Cooperative Society
--To find how many farmers are associated with each cooperative society
SELECT c.CoopID, c.Name AS CoopName, c.District,
       COUNT(fm.FarmerID) AS TotalFarmers
FROM   COOPERATIVE_SOCIETY c
LEFT JOIN FARMER_MEMBERSHIP fm ON c.CoopID = fm.CoopID
GROUP BY c.CoopID, c.Name, c.District
ORDER BY TotalFarmers DESC;


--3.  Farmers with No Cooperative Membership
--To identify farmers who are not part of any cooperative society
SELECT f.FarmerID, f.Name, f.Phone, f.Village
FROM   FARMER f
LEFT JOIN FARMER_MEMBERSHIP fm ON f.FarmerID = fm.FarmerID
WHERE  fm.MemberID IS NULL;
Crop Lot & Procurement Queries


--4.  Total Quantity and Value Procured per Crop
--To see total quantity and total value of each crop sold
SELECT cl.CropName,
       SUM(p.QtyKg)       AS TotalProcuredKg,
       SUM(p.TotalAmt)    AS TotalProcureValue,
       AVG(p.PricePerKg)  AS AvgPricePerKg
FROM   PROCUREMENT p
JOIN   CROP_LOT cl ON p.LotID = cl.LotID
GROUP BY cl.CropName
ORDER BY TotalProcuredKg DESC;


--5.  Quality Check Results with Farmer and Crop Details
--To display farmer, crop, and quality check details together
SELECT f.Name AS FarmerName, cl.CropName, cl.Variety,
       cl.QtyKg AS LotQtyKg, qc.Grade,
       qc.MoisturePct, qc.Inspector, qc.QCDate
FROM   CROP_LOT cl
JOIN   FARMER f   ON cl.FarmerID = f.FarmerID
LEFT JOIN QUALITY_CHECK qc ON cl.LotID = qc.LotID
ORDER BY qc.QCDate DESC;


--6.  Quality Grade Distribution (Count and Avg Moisture)
--To check how many lots fall under each quality grade and their average moisture
SELECT qc.Grade,
       COUNT(qc.QCID)       AS TotalLots,
       AVG(qc.MoisturePct)  AS AvgMoisture
FROM   QUALITY_CHECK qc
GROUP BY qc.Grade
ORDER BY qc.Grade;


--7.  Members with Overdue/Unpaid Membership Fees Finance who hasn't paid their membership fee.
  SELECT f.FarmerID, f.Name AS FarmerName, 
  f.Phone, f.Village, c.Name AS CoopName, fm.EnrollDate, fm.MemberFee, fm.Status AS MembershipStatus 
  FROM FARMER f 
  JOIN FARMER_MEMBERSHIP fm ON f.FarmerID = fm.FarmerID 
  JOIN COOPERATIVE_SOCIETY c ON fm.CoopID = c.CoopID 
  WHERE fm.Status = 'Inactive' 
  ORDER BY c.Name, f.Name;


--8.  Procurements with No Linked Payment (Pending Payments)
--To find procurements where payment has not been made yet
SELECT f.Name AS FarmerName, p.ProcureID,
       p.ProcureDate, p.TotalAmt AS AmountDue
FROM   PROCUREMENT p
JOIN   CROP_LOT cl ON p.LotID = cl.LotID
JOIN   FARMER f    ON cl.FarmerID = f.FarmerID
LEFT JOIN FARMER_PAYMENT fp ON p.ProcureID = fp.ProcureID
WHERE  fp.PaymentID IS NULL;


--Inventory & Warehouse Queries
--9.  Current Stock Available in Each Warehouse
--To check how much stock is available in each warehouse
SELECT w.WarehouseID, w.Location,
       c.Name AS CoopName,
       i.CropName, i.Grade,
       SUM(i.QtyAvailKg) AS TotalStockKg
FROM   WAREHOUSE w
JOIN   COOPERATIVE_SOCIETY c ON w.CoopID = c.CoopID
LEFT JOIN INVENTORY i ON w.WarehouseID = i.WarehouseID
GROUP BY w.WarehouseID, w.Location, c.Name, i.CropName, i.Grade
ORDER BY TotalStockKg DESC;


--10.  Warehouses Running Near Full Capacity (> 80%)
--To identify warehouses that are almost full (more than 80% capacity)
SELECT w.WarehouseID, w.Location, w.CapacityKg,
       SUM(i.QtyAvailKg) AS UsedKg,
       ROUND(SUM(i.QtyAvailKg) * 100.0 / w.CapacityKg, 2) AS UtilizationPct
FROM   WAREHOUSE w
LEFT JOIN INVENTORY i ON w.WarehouseID = i.WarehouseID
GROUP BY w.WarehouseID, w.Location, w.CapacityKg
HAVING UtilizationPct > 80
ORDER BY UtilizationPct DESC;
Order & Buyer Queries


--11.  All Orders with Buyer Name and Order Value
--To view order details with total quantity and total value
SELECT oh.OrderID, b.BizName AS BuyerName,
       oh.OrderDate, oh.Status,
       SUM(oi.QtyKg)      AS TotalQtyKg,
       SUM(oi.TotalAmt)   AS OrderValue
FROM   ORDER_HEADER oh
JOIN   BUYER b          ON oh.BuyerID  = b.BuyerID
LEFT JOIN ORDER_ITEM oi ON oh.OrderID  = oi.OrderID
GROUP BY oh.OrderID, b.BizName, oh.OrderDate, oh.Status
ORDER BY oh.OrderDate DESC;


--12.  Top Buyers by Total Purchase Value
--To find top buyers based on total purchase value
SELECT b.BuyerID, b.BizName, b.Type AS BuyerType,
       COUNT(DISTINCT oh.OrderID) AS TotalOrders,
       SUM(oi.TotalAmt)           AS TotalPurchaseValue
FROM   BUYER b
JOIN   ORDER_HEADER oh ON b.BuyerID   = oh.BuyerID
JOIN   ORDER_ITEM   oi ON oh.OrderID  = oi.OrderID
GROUP BY b.BuyerID, b.BizName, b.Type
ORDER BY TotalPurchaseValue DESC;
Transport & Logistics Queries


--13.  Transport Jobs with Vehicle and Logistics Partner Details
--To view complete transport details including vehicle and logistics partner
SELECT tj.JobID, lp.Name AS PartnerName,
       v.VehicleType, v.RegNo, v.CapacityKg,
       tj.SchedDate, tj.Status, tj.AmtPayable
FROM   TRANSPORT_JOB tj
JOIN   VEHICLE v             ON tj.VehicleID = v.VehicleID
JOIN   LOGISTICS_PARTNER lp  ON v.PartnerID  = lp.PartnerID
LEFT JOIN ORDER_HEADER oh    ON tj.OrderID   = oh.OrderID
ORDER BY tj.SchedDate DESC;
Subsidy Queries


--14.  Total Subsidy Disbursed per Scheme with Farmer Count
--To see total subsidy distributed and number of farmers benefited per scheme
SELECT ss.SchemeID, ss.SchemeName, ss.Type,
       ss.EligibleCrop,
       COUNT(DISTINCT sd.FarmerID) AS FarmersBenefited,
       SUM(sd.AmtDisbursed)        AS TotalDisbursed
FROM   SUBSIDY_SCHEME ss
LEFT JOIN SUBSIDY_DISBURSEMENT sd ON ss.SchemeID = sd.SchemeID
GROUP BY ss.SchemeID, ss.SchemeName, ss.Type, ss.EligibleCrop
ORDER BY TotalDisbursed DESC;


--15.  Full Farmer Benefit Report (Payment + Subsidy Combined)
--To calculate total benefit (payment + subsidy) received by each farmer
SELECT f.FarmerID, f.Name AS FarmerName, f.Village,
       SUM(fp.NetPayable)   AS TotalPayment,
       SUM(sd.AmtDisbursed) AS TotalSubsidy,
       SUM(fp.NetPayable) + COALESCE(SUM(sd.AmtDisbursed), 0)
                            AS TotalBenefit
FROM   FARMER f
JOIN   FARMER_PAYMENT          fp ON f.FarmerID = fp.FarmerID
LEFT JOIN SUBSIDY_DISBURSEMENT sd ON f.FarmerID = sd.FarmerID
GROUP BY f.FarmerID, f.Name, f.Village
ORDER BY TotalBenefit DESC;
