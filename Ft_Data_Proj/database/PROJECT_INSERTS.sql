--ALL INSERTS																									
BEGIN TRANSACTION																									
BEGIN TRY																									
																									
--1																									
INSERT INTO CLIENT (cID, ClientName, Caddress)																									
VALUES																									
('C000000001', 'Client A', '123 Main St, City A, State A, 10001'),																									
('C000000002', 'Client B', '456 Market St, City B, State B, 10002'),																									
('C000000003', 'Client C', '789 Park Ave, City C, State C, 10003'),																									
('C000000004', 'Client D', '321 Oak St, City D, State D, 10004'),																									
('C000000005', 'Client E', '654 Elm St, City E, State E, 10005');																									
																									
INSERT INTO [Supplier] (suppID, suppName, suppAddress)																									
VALUES																									
('S000000001', 'Merrifield Garden Center', '6895 Wellington Rd, Gainesville, VA, 20156')																									
, ('S000000002', 'Home Depot', '15450 John Marshall Hwy, Haymarket, VA, 20169')																									
, ('S000000003', 'Peterbilt of Northern VA', '5509 Wellington Rd, Gainesville, VA, 20155')																									
, ('S000000004', 'Lowes', '13000 Gateway Center Dr, Gainesville, VA, 20155')																									
, ('S000000005', 'Meadows Farms Nurseries and Landscape', '5074 Lee Hwy, Warrenton, VA, 20187')																									
																									
--2																									
INSERT INTO [PROJECT CONTACT] (contactID, Lname, cID, Fname)																									
VALUES																									
('PRJCON0001', 'Doe', 'C000000001', 'John'),																									
('PRJCON0002', 'Smith', 'C000000002', 'Jane'),																									
('PRJCON0003', 'Johnson', 'C000000003', 'James'),																									
('PRJCON0004', 'Williams', 'C000000004', 'Linda'),																									
('PRJCON0005', 'Brown', 'C000000005', 'Michael');																									
																									
--3																									
INSERT INTO PROJECT (projID, ProjectName, pAddress, cID, contactID)																									
VALUES																									
('PRJ0000001', 'Project Alpha', '123 Main St, City A, State A, 10001', 'C000000001', 'PRJCON0001'),																									
('PRJ0000002', 'Project Beta', '456 Market St, City B, State B, 10002', 'C000000002', 'PRJCON0002'),																									
('PRJ0000003', 'Project Gamma', '789 Park Ave, City C, Stte C, 10003', 'C000000003', 'PRJCON0003'),																									
('PRJ0000004', 'Project Delta', '321 Oak St, City D, State D, 10004', 'C000000004', 'PRJCON0004'),																									
('PRJ0000005', 'Project Epsilon', '654 Elm St, City E, State E, 10005', 'C000000005', 'PRJCON0005');																									
																									
--4																									
INSERT INTO [DESIGN BID] (bidID, biddate, estBeginDate, estComplDate, bidAmount, projID, acceptedORrejected)																									
VALUES																									
('BID0000001', '2023-05-01', '2023-06-01', '2023-12-01', 10000.00, 'PRJ0000001', 'A'),																									
('BID0000002', '2023-05-02', '2023-06-15', '2023-12-15', 12000.00, 'PRJ0000002', 'R'),																									
('BID0000003', '2023-05-03', '2023-07-01', '2024-01-01', 15000.00, 'PRJ0000003', 'A'),																									
('BID0000004', '2023-05-04', '2023-07-15', '2024-01-15', 13000.00, 'PRJ0000004', 'R'),																									
('BID0000005', '2023-05-05', '2023-08-01', '2024-02-01', 11000.00, 'PRJ0000005', 'A'),																									
('BID0000008', '2023-05-04', '2023-07-15', '2024-01-15', 13000.00, 'PRJ0000004', 'A'),																									
('BID0000000', '2023-05-05', '2023-08-01', '2024-02-01', 11000.00, 'PRJ0000005', 'A');																									
																									
--5																									
INSERT INTO [EMPLOYEE] (empID, empName, ePhone)																									
VALUES																									
('EMP0000001', 'John Doe', '5551234567'),																									
('EMP0000002', 'Jane Smith', '5559876543'),																									
('EMP0000003', 'Alice Johnson', '5556543210'),																									
('EMP0000004', 'Bob Brown', '5557778888'),																									
('EMP0000005', 'Carol White', '5551237890');																									
																									
--6																									
INSERT INTO TOOL (toolCode, toolName, qtyInStock)																									
VALUES																									
('TOOL000001', 'Craftsman Power Drill', 30)																									
, ('TOOL000002', 'Cobalt Rubber Mallet', 100)																									
, ('TOOL000003', 'Gardening Spade', 44)																									
, ('TOOL000004', 'Large Shovel', 320)																									
, ('TOOL000005', 'Electric Portable Lamp', 57)																									
																									
--7																									
INSERT INTO LABOR_AND_CHARGE (laborCode, laborDescription, listedChargePerHour)																									
VALUES ('LC00000001', 'Bid Process', 40);																									
																									
INSERT INTO LABOR_AND_CHARGE (laborCode, laborDescription, listedChargePerHour)																									
VALUES ('LC00000002', 'Final Blueprint', 40);																									
																									
INSERT INTO LABOR_AND_CHARGE (laborCode, laborDescription, listedChargePerHour)																									
VALUES ('LC00000003', 'install large plant', 18);																									
																									
INSERT INTO LABOR_AND_CHARGE (laborCode, laborDescription, listedChargePerHour)																									
VALUES ('LC00000004', 'Install small plant', 18);																									
																									
INSERT INTO LABOR_AND_CHARGE (laborCode, laborDescription, listedChargePerHour)																									
VALUES ('LC00000005', 'Remove structure', 18);																									
																									
--8																									
INSERT INTO [EMP-BID-ROLE] (empID, bidID, [role])																									
VALUES																									
('EMP0000001', 'BID0000001', 'Designer'),																									
('EMP0000002', 'BID0000002', 'Developer'),																									
('EMP0000003', 'BID0000003', 'Designer'),																									
('EMP0000004', 'BID0000004', 'Manager'),																									
('EMP0000005', 'BID0000005', 'Designer');																									
																									
--																									
/*																									
INSERT INTO [BID-LABOR] (laborCode, bidID, hoursOnBid, chargePerHourOnBid)																									
VALUES																									
('LC00000001', 'BID0000001', 100, 50.00),																									
('LC00000002', 'BID0000002', 120, 45.00),																									
('LC00000003', 'BID0000003', 150, 55.00),																									
('LC00000004', 'BID0000004', 130, 60.00),																									
('LC00000005', 'BID0000005', 110, 65.00);																									
*/																									
																									
--9																									
INSERT INTO MATERIAL (typeOfMaterial, materialID, [description])																									
VALUES ('BK', 'MAT0000001', 'decorative cedar bark')																									
, ('TS', 'MAT0000002', 'top soil')																									
, ('CG', 'MAT0000003', 'crushed granite')																									
, ('PG', 'MAT0000004', 'pea gravel')																									
, ('GR', 'MAT0000005', 'gravel')																									
, ('GT', 'MAT0000045', 'Gold Tamarix')																									
, ('HU','MAT0000087', 'Urn plant')																									
, ('GE', 'MAT0000047','Geastrum')																									
, ('NB', 'MAT0000026', 'Neillia')																									
, ('GR', 'MAT0000108','GAURA')																									
, ('KL', 'MAT0000201', 'Kiln Ladle')																									
, ('LO', 'MAT0000502', 'Looking Owl Pot')																									
, ('VT', 'MAT0000704', 'Venerated Teapot')																									
, ('RR', 'MAT0000806', 'Railroad Themed Pot')																									
, ('XT', 'MAT0000934', 'Exhausted Teal')																									
, ('UT', 'MAT0000956','Underground Torque')																									
, ('PT', 'MAT0000889', 'Protected Tree')																									
, ('KT', 'MAT0000354', 'Kansas Thunder')																									
, ('RA', 'MAT0000556', 'Red Avarice')																									
, ('GZ', 'MAT0000444', 'Gen Z Shirt')																									
																									
--10																									
INSERT INTO [BID-MATERIALS] (typeOfMaterial, bidID, materialID, QtyOnBid, UnitPriceForBid)																									
VALUES ('RR', 'BID0000001', 'MAT0000806', 1, 500.00),																									
	('RA', 'BID0000002', 'MAT0000556', 23, 74.00),																								
	('KL', 'BID0000002', 'MAT0000201', 10, 140.00),																								
	('XT', 'BID0000003', 'MAT0000934', 60, 125.00),																								
	('VT', 'BID0000005', 'MAT0000704', 80, 150.00);																								
																									
INSERT INTO rejected (bidID, rejectionDate, invitedRevision)																									
VALUES ('BID0000002', '2023-06-02', 0),																									
	('BID0000004', '2023-06-12', 1);																								
																									
INSERT INTO approved (bidID, acceptedDate, tentativeStartDate, approvedByName)																									
VALUES ('BID0000001', '2023-05-05', '2023-06-01', 'PINILLA'),																									
	('BID0000003', '2023-05-10', '2024-01-01', 'ROBAYO'),																								
	('BID0000005', '2023-05-15', '2023-08-01', 'PESSI'),																								
	('BID0000008', '2023-05-20', '2023-08-06', 'PENALDO'),																								
	('BID0000000', '2023-05-25', '2023-08-16', 'FRAUDIOLA');																								
																									
--------------------------------------------------------------------------------------																									
INSERT INTO [OTHER MATERIAL] (																									
[materialID],																									
[typeOfMaterial],																									
[size],																									
[sizeUnits]																									
, [quantityinStock]																									
)																									
VALUES ('MAT0000001', 'BK', 145, 'kg', 11),																									
('MAT0000002', 'TS', 21, 'kg', 2),																									
('MAT0000003', 'CG', 160, 'kg', 3),																									
('MAT0000004', 'PG', 83, 'kg', 5),																									
('MAT0000005', 'GR', 94, 'kg', 7																									
);																									
																									
																									
INSERT INTO [PLANT] (																									
[materialID],																									
[typeOfMaterial],																									
[size],																									
[sizeUnits]																									
,[quantityinStock]																									
)																									
VALUES('MAT0000045', 'GT', 64, 'kg', 30)																									
, ('MAT0000087', 'HU', 29, 'kg', 83)																									
, ('MAT0000047', 'GE', 55, 'kg', 1)																									
, ('MAT0000026', 'NB', 42, 'kg', 400)																									
, ('MAT0000108', 'GR', 100, 'kg', 12)																									
																									
INSERT INTO [POTTERY] (																									
[materialID],																									
[typeOfMaterial],																									
[size],																									
[sizeUnits]																									
, [quantityinStock]																									
)																									
VALUES ('MAT0000201', 'KL', 167, 'kg', 8),																									
('MAT0000502', 'LO', 22, 'kg', 5),																									
('MAT0000704', 'VT', 133, 'kg', 6),																									
('MAT0000806', 'RR', 230, 'kg', 30),																									
('MAT0000934', 'XT', 80, 'kg', 18);																									
																									
																									
																									
INSERT INTO [PRODUCTION PLAN] (bidID, pPlanVersion, ppBeginDate, ppComplDate, previousBidID, previousPPversion)																									
VALUES																									
('BID0000001', '001', '2023-06-01', '2023-10-25', 'BID0000000', '000')																									
, ('BID0000003', '002', '2024-01-01', '2023-07-06', 'BID0000002', '002')																									
, ('BID0000005', '002', '2023-08-01', '2023-12-14', 'BID0000004', '004')																									
, ('BID0000008', '002', '2023-08-06', '2024-01-03', 'BID0000007', '007')																									
, ('BID0000000', '002', '2023-08-16', '2023-10-31', NULL, NULL)																									
																									
INSERT INTO [PP MATERIAL SCHEDULE] (materialScheduleID, qtyScheduled, dateTimeDelivery, dateinstall, pPlanVersion, bidID, materialID, typeOfMaterial)																									
																									
VALUES																									
('DEF456', 245, '2023-05-12 14:00:00', '2023-05-17', '001', 'BID0000002', 'MAT0000002', '02'),																									
('GHI569', 360, '2023-05-15 11:00:00', '2023-05-14', '002', 'BID0000001', 'MAT0000004', '01'),																									
('GHI669', 380, '2023-05-15 09:00:00', '2023-05-23', '002', 'BID0000004', 'MAT0000003', '05'),																									
('GHI459', 330, '2023-05-15 16:00:00', '2023-05-25', '002', 'BID0000007', 'MAT0000006', '02'),																									
('GHI676', 390, '2023-05-15 12:00:00', '2023-05-12', '002', 'BID0000006', 'MAT0000001', '04')																									
																									
																									
																									
																									
																									
																									
INSERT INTO [PROJECT TEAM MEMBER] (projTeamAssignID, pPlanVersion, bidID, empID, laborCode)																									
VALUES																									
('PTM0000001', '001', 'BID0000001', 'EMP0000001', 'LC00000001')																									
, ('PTM0000002', '002', 'BID0000003', 'EMP0000002', 'LC00000002')																									
, ('PTM0000003', '002', 'BID0000008', 'EMP0000003', 'LC00000003')																									
, ('PTM0000004', '002', 'BID0000005', 'EMP0000004', 'LC00000004')																									
, ('PTM0000005', '002', 'BID0000000', 'EMP0000005', 'LC00000005')																									
																									
INSERT INTO [PP TOOL REQUIREMENTS] (toolCode, ppMatID, qtyDelivered, fromDate, toDate, pPlanVersion, bidID)																									
VALUES																									
('TOOL000001', 'PPMAT00001', 5, '2023-06-01', '2023-10-25', '001', 'BID0000001')																									
, ('TOOL000002', 'PPMAT00012', 54, '2023-10-26', NULL, '002', 'BID0000000')																									
, ('TOOL000004', 'PPMAT00023', 10, '2024-01-01', NULL, '002', 'BID0000003')																									
, ('TOOL000004', 'PPMAT00002', 47, '2023-08-06', NULL, '002', 'BID0000008')																									
, ('TOOL000005', 'PPMAT00002', 30, '2023-06-01', '2023-10-26', '001', 'BID0000001')																									
																									
INSERT INTO [Purchase Order] (poID, poDate, subTotal, poTax, poTotal, suppID)																									
VALUES																									
('PO00000006', '2023-04-28', 2376, 200, 2576, 'S000000005')																									
, ('PO00000007', '2023-02-15', 330, 82, 412, 'S000000002')																									
, ('PO00000008', '2022-11-11', 1150, 44, 1194, 'S000000001')																									
, ('PO00000009', '2023-03-12', 330, 20, 350, 'S000000003')																									
, ('PO00000010', '2023-04-01',500, 0, 500, 'S000000005')																									
																									
INSERT INTO [Purchase Order Materials] (poID, materialID, matQty, pricePerUnit, extPrice)																									
VALUES																									
('PO00000006', 'MAT0000354', 44, 54, 2376)																									
, ('PO00000007', 'MAT0000045', 15, 22, 330)																									
, ('PO00000008', 'MAT0000704', 5, 230, 1150)																									
, ('PO00000009', 'MAT0000934', 55,60, 3300)																									
, ('PO00000010', 'MAT0000806', 1, 500, 500)																									
																									
COMMIT TRANSACTION																									
END TRY																									
BEGIN CATCH																									
	ROLLBACK TRANSACTION																								
END CATCH																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									
																									