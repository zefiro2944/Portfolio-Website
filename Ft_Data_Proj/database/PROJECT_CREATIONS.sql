IF DB_ID('NBDBB-dssj') IS NOT NULL
        BEGIN 
                PRINT 'Database with name NBDBB-dssj exists and will be dropped' 
                DROP DATABASE [NBDBB-dssj]
        END 


---------------------------------------------------------------------
CREATE DATABASE [NBDBB-dssj]
--------------------------------------------------------------------
USE [NBDBB-dssj]
----------------------------------------------------------------------------

--CREATE TABLES																																															
																																															
CREATE TABLE [BID-MATERIALS] (																																															
	typeOfMaterial CHAR(2) NOT NULL																																														
	, bidID CHAR(10) NOT NULL																																														
	, materialID CHAR(10) NOT NULL																																														
	, QtyOnBid INT NOT NULL																																														
	, UnitPriceForBid SMALLMONEY NOT NULL																																														
	)																																														
ALTER TABLE [BID-MATERIALS]																																															
	ADD																																														
		CONSTRAINT PK_BID_MATERIALS																																													
			PRIMARY KEY (typeOfMaterial, bidID, materialID);																																												
																																															
CREATE TABLE [PRODUCTION PLAN]																																															
(																																															
	bidID CHAR(10) NOT NULL																																														
	, pPlanVersion CHAR(3) NOT NULL																																														
	, ppBeginDate DATE NOT NULL																																														
	, ppComplDate DATE NOT NULL																																														
	, previousBidID CHAR(10) NULL																																														
	, previousPPversion CHAR(3) NULL																																														
)																																															
																																															
CREATE TABLE [PROJECT TEAM MEMBER]																																															
(																																															
	projTeamAssignID CHAR(10) NOT NULL																																														
	, pPlanVersion CHAR(3) NOT NULL																																														
	, bidID CHAR(10) NOT NULL																																														
	, empID CHAR(10) NOT NULL																																														
	, laborCode CHAR(10) NOT NULL																																														
)																																															
																																															
CREATE TABLE [TOOL]																																															
(																																															
	toolCode CHAR(10) NOT NULL																																														
	, toolName VARCHAR(30) NOT NULL																																														
	, qtyInStock INT NOT NULL																																														
)																																															
																																															
CREATE TABLE [PP TOOL REQUIREMENTS]																																															
(																																															
	toolCode CHAR(10) NOT NULL																																														
	, ppMatID CHAR(10) NOT NULL																																														
	, qtyDelivered INT NOT NULL																																														
	, fromDate DATE NOT NULL																																														
	, toDate DATE NULL																																														
	, pPlanVersion CHAR(3) NOT NULL																																														
	, bidID CHAR(10) NOT NULL																																														
)																																															
																																															
CREATE TABLE [Production Daily Work Report]																																															
(																																															
	pdwrID CHAR(10) NOT NULL																																														
	, pdwrDate DATE NOT NULL																																														
	, submittedBy VARCHAR(50) NOT NULL																																														
)																																															
																																															
CREATE TABLE [Production Daily Work Report Materials]																																															
(																																															
	pdwrID CHAR(10) NOT NULL																																														
	, qtyMaterials INT NULL																																														
	, unitCost MONEY NULL																																														
	, extCost MONEY NULL																																														
	, approvedBy VARCHAR(50) NULL																																														
)																																															
																																															
CREATE TABLE [Production Daily Work Report Labor]																																															
(																																															
	pdwrID CHAR(10) NOT NULL																																														
	, laborHours INT NULL																																														
	, laborCost MONEY NULL																																														
	, extCost MONEY NULL																																														
	, laborTask VARCHAR(50) NULL																																														
)																																															
																																															
CREATE TABLE [Purchase Order]																																															
(																																															
	poID CHAR(10) NOT NULL																																														
	, poDate DATE NOT NULL																																														
	, subTotal MONEY NOT NULL																																														
	, poTax MONEY NOT NULL																																														
	, poTotal MONEY NOT NULL																																														
	, suppID CHAR(10) NOT NULL																																														
)																																															
																																															
CREATE TABLE [Supplier]																																															
(																																															
	suppID CHAR(10) NOT NULL																																														
	, suppName VARCHAR(50) NOT NULL																																														
	, suppAddress VARCHAR(255) NOT NULL																																														
)																																															
																																															
CREATE TABLE [Purchase Order Materials]																																															
(																																															
	poID CHAR(10) NOT NULL																																														
	, materialID CHAR(10) NOT NULL																																														
	, matQty INT NOT NULL																																														
	, pricePerUnit MONEY NOT NULL																																														
	, extPrice MONEY NOT NULL																																														
)																																															
																																															
--PRIMARY KEYS																																															
ALTER TABLE [PRODUCTION PLAN]																																															
	ADD CONSTRAINT PK_prodPlan																																														
		PRIMARY KEY (bidID, pPlanVersion)																																													
																																															
ALTER TABLE [PROJECT TEAM MEMBER]																																															
	ADD CONSTRAINT PK_projTeamMember																																														
		PRIMARY KEY (projTeamAssignID)																																													
																																															
ALTER TABLE [TOOL]																																															
	ADD CONSTRAINT PK_Tool																																														
		PRIMARY KEY (toolCode)																																													
																																															
ALTER TABLE [PP TOOL REQUIREMENTS]																																															
	ADD CONSTRAINT PK_ppToolReq																																														
		PRIMARY KEY (toolCode, ppMatID)																																													
																																															
ALTER TABLE [Production Daily Work Report]																																															
	ADD CONSTRAINT PK_pdwrID																																														
		PRIMARY KEY (pdwrID)																																													
																																															
ALTER TABLE [Production Daily Work Report Materials]																																															
	ADD CONSTRAINT PK_pdwrIDMats																																														
		PRIMARY KEY (pdwrID)																																													
																																															
ALTER TABLE [Production Daily Work Report Labor]																																															
	ADD CONSTRAINT PK_pdwrIDLabor																																														
		PRIMARY KEY (pdwrID)																																													
																																															
ALTER TABLE [Purchase Order]																																															
	ADD CONSTRAINT PK_purchaseOrder																																														
		PRIMARY KEY (poID)																																													
																																															
ALTER TABLE [Supplier]																																															
	ADD CONSTRAINT PK_supplier																																														
		PRIMARY KEY (suppID)																																													
																																															
ALTER TABLE [Purchase Order Materials]																																															
	ADD CONSTRAINT PK_poMats																																														
		PRIMARY KEY (poID)																																													
																																															
--FOREIGN KEYS																																															
																																															
																																															
																																															
																																															
																																															
--																																															
CREATE TABLE CLIENT (																																															
	cID CHAR(10) NOT NULL																																														
	, ClientName VARCHAR(25) NOT NULL																																														
	, Caddress VARCHAR(250) NOT NULL																																														
	)																																														
																																															
CREATE TABLE [PROJECT CONTACT] (																																															
	contactID CHAR(10) NOT NULL																																														
	, Lname VARCHAR(50) NOT NULL																																														
	, cID CHAR(10) NOT NULL																																														
	, Fname VARCHAR(25) NOT NULL																																														
	)																																														
																																															
																																															
CREATE TABLE PROJECT (																																															
	projID CHAR(10) NOT NULL																																														
	, ProjectName VARCHAR(30) NOT NULL																																														
	, pAddress VARCHAR(250) NOT NULL																																														
	, cID CHAR(10) NOT NULL																																														
	, contactID CHAR(10) NULL																																														
	)																																														
																																															
CREATE TABLE [DESIGN BID] (																																															
	bidID CHAR(10) NOT NULL																																														
	, biddate DATE NOT NULL																																														
	, estBeginDate DATE NOT NULL																																														
	, estComplDate DATE NOT NULL																																														
	, bidAmount SMALLMONEY NOT NULL																																														
	, projID char(10) NOT NULL																																														
	, acceptedORrejected CHAR(1) NULL																																														
	)																																														
																																															
CREATE TABLE [BID-LABOR] (																																															
	laborCode CHAR(10) NOT NULL																																														
	, bidID CHAR(10) NOT NULL																																														
	, hoursOnBid INT NOT NULL																																														
	, chargePerHourOnBid SMALLMONEY NOT NULL																																														
	)																																														
																																															
CREATE TABLE LABOR_AND_CHARGE (																																															
laborCode CHAR(10) NOT NULL,																																															
laborDescription VARCHAR(50) NOT NULL,																																															
listedChargePerHour SMALLMONEY NOT NULL,																																															
)																																															
																																															
CREATE TABLE [EMP-BID-ROLE] (																																															
empID char(10) NOT NULL																																															
, bidID char(10) NOT NULL																																															
, [role] varchar(15) NOT NULL																																															
)																																															
																																															
CREATE TABLE [EMPLOYEE]																																															
(																																															
empID CHAR(10) NOT NULL																																															
, empName VARCHAR(30) NOT NULL																																															
, ePhone CHAR(10) NOT NULL																																															
	)																																														
																																															
CREATE TABLE MATERIAL (																																															
	typeOfMaterial CHAR(2)NOT NULL																																														
	, materialID CHAR(10) NOT NULL																																														
	, [description] VARCHAR(50) NOT NULL																																														
	)																																														
																																															
CREATE TABLE INVOICE (																																															
	InvNum CHAR(10) NOT NULL																																														
	, InvDate DATE NOT NULL																																														
	, InvoiceShipDate DATE NOT NULL																																														
	, InvAccount VARCHAR(25) NOT NULL																																														
	, Note VARCHAR(250) NULL																																														
	)																																														
																																															
CREATE TABLE [INVOICE-MATERIAL] (																																															
	QtyShipped INT NOT NULL																																														
	, UnitPrice DECIMAL(10, 2) NOT NULL																																														
	, ExtPrice DECIMAL(10, 2) NOT NULL																																														
	, Inv_material_id CHAR(10) NOT NULL																																														
	, InvNum CHAR(10) NOT NULL																																														
);																																															
--																																															
ALTER TABLE CLIENT																																															
	ADD																																														
		CONSTRAINT PK_CLIENT																																													
			PRIMARY KEY (cID);																																												
																																															
																																															
ALTER TABLE CLIENT																																															
ADD CONSTRAINT CK_CLIENT_ClientName																																															
CHECK (ClientName NOT LIKE '%[^a-zA-Z ]%');																																															
																																															
ALTER TABLE CLIENT																																															
ADD CONSTRAINT CK_CLIENT_Caddress																																															
CHECK (LEN(Caddress) > 10);																																															
																																															
ALTER TABLE [PROJECT CONTACT]																																															
	ADD																																														
		CONSTRAINT PK_PROJECT_CONTACT																																													
			PRIMARY KEY (contactID);																																												
																																															
ALTER TABLE [PROJECT CONTACT]																																															
ADD CONSTRAINT CK_PROJECT_CONTACT_Lname																																															
CHECK (LEN(Lname) <= 50);																																															
																																															
ALTER TABLE PROJECT																																															
	ADD																																														
		CONSTRAINT PK_PROJECT																																													
			PRIMARY KEY (projID);																																												
																																															
ALTER TABLE PROJECT																																															
ADD CONSTRAINT CK_PROJECT_ProjectName																																															
CHECK (LEN(ProjectName) BETWEEN 3 AND 30);																																															
																																															
ALTER TABLE PROJECT																																															
ADD CONSTRAINT CK_PROJECT_pAddress																																															
CHECK (LEN(pAddress) BETWEEN 10 AND 250);																																															
																																															
ALTER TABLE PROJECT																																															
ADD CONSTRAINT CK_PROJECT_cID																																															
CHECK (cID LIKE 'C%[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');																																															
																																															
ALTER TABLE PROJECT																																															
ADD CONSTRAINT CK_PROJECT_contactID																																															
CHECK (contactID LIKE 'PRJCON%[0-9][0-9][0-9][0-9]');																																															
																																															
ALTER TABLE [DESIGN BID]																																															
	ADD																																														
		CONSTRAINT PK_DESIGN_BID																																													
			PRIMARY KEY (bidID);																																												
																																															
ALTER TABLE [DESIGN BID]																																															
ADD CONSTRAINT CK_DESIGN_BID_estDates																																															
CHECK (estBeginDate <= estComplDate																																															
AND estBeginDate BETWEEN '2023-01-01' AND '2023-12-31'																																															
AND estComplDate BETWEEN '2023-01-01' AND '2024-12-31');																																															
																																															
ALTER TABLE [DESIGN BID]																																															
ADD CONSTRAINT CK_DESIGN_BID_bidAmount																																															
CHECK (bidAmount >= 0);																																															
																																															
ALTER TABLE [BID-LABOR]																																															
	ADD																																														
		CONSTRAINT PK_BID_LABOR																																													
			PRIMARY KEY (laborCode, bidID);																																												
																																															
ALTER TABLE [BID-LABOR]																																															
ADD CONSTRAINT CK_BID_LABOR_hoursOnBid																																															
CHECK (hoursOnBid >= 0);																																															
																																															
ALTER TABLE [BID-LABOR]																																															
ADD CONSTRAINT CK_BID_LABOR_chargePerHourOnBid																																															
CHECK (chargePerHourOnBid >= 0);																																															
																																															
ALTER TABLE [BID-LABOR]																																															
ADD CONSTRAINT CK_BID_LABOR_hoursOnBid2																																															
CHECK (hoursOnBid IN (80, 100, 120, 160, 200));																																															
																																															
ALTER TABLE LABOR_AND_CHARGE																																															
	ADD																																														
		CONSTRAINT pk_labor_and_charge																																													
			PRIMARY KEY (laborCode);																																												
																																															
ALTER TABLE [EMP-BID-ROLE]																																															
	ADD																																														
		CONSTRAINT PK_EMP_BID_ROLE																																													
			PRIMARY KEY (empID, bidID);																																												
																																															
																																															
ALTER TABLE [EMPLOYEE]																																															
	ADD CONSTRAINT PK_Employee																																														
		PRIMARY KEY (empID)																																													
																																															
ALTER TABLE MATERIAL																																															
	ADD																																														
		CONSTRAINT pk_material1 PRIMARY KEY (typeOfMaterial, materialID);																																													
																																															
																																															
ALTER TABLE MATERIAL																																															
ADD CONSTRAINT chk_description_length CHECK (LEN([description]) <= 50);																																															
																																															
ALTER TABLE INVOICE																																															
	ADD																																														
		CONSTRAINT PK_Invoice_Num																																													
			PRIMARY KEY (InvNum);																																												
																																															
ALTER TABLE INVOICE																																															
	ADD																																														
		CONSTRAINT CK_InvoiceShipDate_Valid CHECK (InvoiceShipDate >= InvDate);																																													
ALTER TABLE [INVOICE-MATERIAL]																																															
	ADD																																														
		CONSTRAINT PK_Invoice_Material																																													
			PRIMARY KEY (Inv_material_id)																																												
																																															
																																															
ALTER TABLE [INVOICE-MATERIAL]																																															
ADD CONSTRAINT CHK_QtyShipped_Positive CHECK (QtyShipped >= 0);																																															
																																															
																																															
CREATE TABLE rejected (																																															
bidID CHAR(10) NOT NULL,																																															
rejectionDate DATE NOT NULL,																																															
invitedRevision BIT NOT NULL																																															
);																																															
																																															
ALTER TABLE rejected																																															
ADD CONSTRAINT pk_rejected PRIMARY KEY (bidID);																																															
																																															
ALTER TABLE rejected																																															
	ADD																																														
		CONSTRAINT FK_rejected																																													
			FOREIGN KEY (bidID) REFERENCES [DESIGN BID] (bidID)																																												
																																															
																																															
																																															
CREATE TABLE approved (																																															
bidID CHAR(10) NOT NULL ,																																															
acceptedDate DATE NOT NULL,																																															
tentativeStartDate DATE NULL,																																															
approvedByName VARCHAR(30) NULL																																															
);																																															
																																															
ALTER TABLE approved																																															
ADD CONSTRAINT pk_approved PRIMARY KEY (bidID);																																															
																																															
ALTER TABLE rejected																																															
	ADD																																														
		CONSTRAINT FK_approved																																													
			FOREIGN KEY (bidID) REFERENCES [DESIGN BID] (bidID)																																												
																																															
																																															
CREATE TABLE PROJECT_TASKS (																																															
taskID CHAR(10) NOT NULL,																																															
hoursCharged INT NOT NULL,																																															
taskDescription VARCHAR(200) NULL,																																															
dateByCompletion DATETIME NULL,																																															
dateOfCompletion DATETIME NOT NULL																																															
);																																															
																																															
ALTER TABLE PROJECT_TASKS																																															
ADD CONSTRAINT pk_project_tasks PRIMARY KEY (taskID);																																															
																																															
CREATE TABLE [OTHER MATERIAL](																																															
materialID char (10) NOT NULL																																															
, typeOfMaterial char(2) NOT NULL																																															
, size int NULL																																															
, sizeUnits varchar (10) NOT NULL																																															
, quantityinStock int NOT NULL																																															
);																																															
																																															
ALTER TABLE [OTHER MATERIAL]																																															
	ADD CONSTRAINT PK_OM																																														
		PRIMARY KEY (materialID)																																													
																																															
CREATE TABLE [POTTERY] (																																															
[materialID] char(10) NOT NULL,																																															
[typeOfMaterial] char(2) NOT NULL,																																															
[size] int NOT NULL,																																															
[sizeUnits] varchar(10) NOT NULL,																																															
[quantityinStock] int NOT NULL																																															
)																																															
ALTER TABLE [POTTERY]																																															
	ADD CONSTRAINT PK_POTTERY																																														
		PRIMARY KEY (materialID)																																													
																																															
																																															
CREATE TABLE [PLANT](																																															
materialID char (10) NOT NULL																																															
, typeOfMaterial char(2) NOT NULL																																															
, size int NOT NULL																																															
, sizeUnits varchar (10) NOT NULL																																															
, [quantityinStock] int NOT NULL																																															
)																																															
ALTER TABLE [PLANT]																																															
	ADD CONSTRAINT PK_PLANT																																														
		PRIMARY KEY (materialID)																																													
CREATE TABLE [PP MATERIAL SCHEDULE] (																																															
materialScheduleID char(10) NOT NULL																																															
, qtyScheduled int NOT NULL																																															
, dateTimeDelivery datetime NOT NULL																																															
, dateinstall date NOT NULL																																															
, pPlanVersion char(3) NOT NULL																																															
, bidID char(10) NOT NULL																																															
, materialID char(10) NOT NULL																																															
, typeOfMaterial char(2) NOT NULL) ;																																															
																																															
ALTER TABLE [PP MATERIAL SCHEDULE]																																															
ADD CONSTRAINT PK_materialScheduleID PRIMARY KEY (materialScheduleID);																																															
																																															
																																															
CREATE TABLE [EMPLOYEE-PROJECT-TASK](																																															
projTeamAssignID char(10) NOT NULL																																															
, taskID char(10) NOT NULL );																																															
																																															
																																															
CREATE TABLE [MATERIAL REQUIREMENTS](																																															
qtny varchar (15) NOT NULL																																															
, [desc] varchar (15) NOT NULL																																															
, size varchar (15) NOT NULL																																															
, unit_price money NOT NULL																																															
, extended_price money NOT NULL																																															
)																																															
																																															
																																															
CREATE TABLE [TOOL SCHEDULE] (																																															
toolScheduleID char(10) NOT NULL,																																															
toolName varchar(50) NOT NULL,																																															
toolType varchar(50) NOT NULL,																																															
startDate datetime NOT NULL,																																															
endDate datetime NOT NULL,																																															
projectID char(10) NOT NULL,																																															
employeeID char(10) NOT NULL,																																															
)																																															
ALTER TABLE [TOOL SCHEDULE]																																															
	ADD CONSTRAINT PK_toolScheduleID PRIMARY KEY (toolScheduleID)																																														
																																															
ALTER TABLE [PROJECT TEAM MEMBER]																																															
	ADD CONSTRAINT FK_ptmEmployee																																														
		FOREIGN KEY (empID)																																													
			REFERENCES [EMPLOYEE] (empID)																																												
																																															
ALTER TABLE [PROJECT TEAM MEMBER]																																															
	ADD CONSTRAINT FK_ptmLabor																																														
		FOREIGN KEY (laborCode)																																													
			REFERENCES [LABOR_AND_CHARGE] (laborCode)																																												
																																															
ALTER TABLE [PP TOOL REQUIREMENTS]																																															
	ADD CONSTRAINT FK_toolReqProdPlan																																														
		FOREIGN KEY (bidID, pPlanVersion)																																													
			REFERENCES [PRODUCTION PLAN] (bidID, pPlanVersion)																																												
																																															
ALTER TABLE [PP TOOL REQUIREMENTS]																																															
	ADD CONSTRAINT FK1_pptool_req																																														
		FOREIGN KEY (toolCode)																																													
			REFERENCES [TOOL] (toolCode)																																												
																																															
ALTER TABLE [Production Daily Work Report Materials]																																															
	ADD CONSTRAINT FK_pdwrIDMats																																														
		FOREIGN KEY (pdwrID)																																													
			REFERENCES [Production Daily Work Report] (pdwrID)																																												
																																															
ALTER TABLE [Production Daily Work Report Labor]																																															
	ADD CONSTRAINT FK_pdwrIDLabor																																														
		FOREIGN KEY (pdwrID)																																													
			REFERENCES [Production Daily Work Report] (pdwrID)																																												
																																															
ALTER TABLE [Purchase Order]																																															
	ADD CONSTRAINT FK_purchaseOrder																																														
		FOREIGN KEY (suppID)																																													
			REFERENCES [Supplier] (suppID)																																												
																																															
ALTER TABLE [Purchase Order Materials]																																															
	ADD CONSTRAINT FK_poMats																																														
		FOREIGN KEY (poID)																																													
			REFERENCES [Purchase Order] (poID)																																												
																																															
ALTER TABLE [PROJECT CONTACT]																																															
	ADD																																														
		CONSTRAINT FK_PROJECT_CONTACT																																													
			FOREIGN KEY (cID) REFERENCES CLIENT (cID);																																												
ALTER TABLE PROJECT																																															
	ADD																																														
		CONSTRAINT FK_PROJECT																																													
			FOREIGN KEY (contactID) REFERENCES [PROJECT CONTACT] (contactID);																																												
ALTER TABLE [DESIGN BID]																																															
	ADD																																														
		CONSTRAINT FK_DESIGN_BID																																													
			FOREIGN KEY (projID) REFERENCES PROJECT (projID);																																												
ALTER TABLE [BID-LABOR]																																															
	ADD																																														
		CONSTRAINT FK1_BID_LABOR																																													
			FOREIGN KEY (laborCode) REFERENCES [LABOR_AND_CHARGE] (laborCode);																																												
																																															
ALTER TABLE [EMP-BID-ROLE]																																															
	ADD																																														
		CONSTRAINT FK2_BID_LABOR																																													
			FOREIGN KEY (bidID) REFERENCES [DESIGN BID] (bidID);																																												
ALTER TABLE [EMP-BID-ROLE]																																															
	ADD																																														
		CONSTRAINT FK1_empID																																													
			FOREIGN KEY (empID) REFERENCES EMPLOYEE (empID);																																												
																																															
ALTER TABLE [EMP-BID-ROLE]																																															
	ADD																																														
		CONSTRAINT FK2_bidID																																													
			FOREIGN KEY (bidID) REFERENCES [DESIGN BID] (bidID);																																												
ALTER TABLE [INVOICE-MATERIAL]																																															
	ADD																																														
		CONSTRAINT FK_Invoice_Material																																													
			FOREIGN KEY (InvNum) REFERENCES [INVOICE] (InvNum)																																												
																																															
ALTER TABLE [PRODUCTION PLAN]																																															
	ADD CONSTRAINT FK_prodPlan																																														
		FOREIGN KEY (bidID)																																													
			REFERENCES [approved](bidID)																																												
ALTER TABLE [OTHER MATERIAL]																																															
	ADD CONSTRAINT																																														
		FK_otherMaterials																																													
			FOREIGN KEY (typeOfMaterial, materialID)																																												
				REFERENCES MATERIAL (typeOfMaterial, materialID)																																											
ALTER TABLE [POTTERY]																																															
ADD CONSTRAINT [FK_POTTERY] FOREIGN KEY (typeOfMaterial, materialID) REFERENCES [MATERIAL] (typeOfMaterial, materialID)																																															
																																															
ALTER TABLE [EMPLOYEE-PROJECT-TASK]																																															
ADD CONSTRAINT FK_projTeamAssignID FOREIGN KEY (projTeamAssignID) REFERENCES [PROJECT TEAM MEMBER] (projTeamAssignID);																																															
ALTER TABLE [EMPLOYEE-PROJECT-TASK]																																															
	ADD CONSTRAINT PK_EPT																																														
		PRIMARY KEY (projTeamAssignID, taskID)																																													
ALTER TABLE [EMPLOYEE-PROJECT-TASK]																																															
ADD CONSTRAINT FK_taskID FOREIGN KEY (taskID) REFERENCES [PROJECT_TASKS] (taskID);																																															
ALTER TABLE [TOOL SCHEDULE]																																															
	ADD CONSTRAINT FK_projectID FOREIGN KEY (projectID) REFERENCES PROJECT (projID)																																														
ALTER TABLE [TOOL SCHEDULE]																																															
	ADD CONSTRAINT FK_employeeID FOREIGN KEY (employeeID) REFERENCES EMPLOYEE (empID)																																														
ALTER TABLE [PROJECT TEAM MEMBER]																																															
	ADD CONSTRAINT FK_ptmProdPlan																																														
		FOREIGN KEY (bidID, pPlanVersion)																																													
			REFERENCES [PRODUCTION PLAN] (bidID, pPlanVersion)																																												
ALTER TABLE [PLANT]																																															
	ADD CONSTRAINT FK_PLANT FOREIGN KEY (typeOfMaterial, materialID) REFERENCES MATERIAL (typeOfMaterial, materialID)																																														
ALTER TABLE [Production Plan]																																															
	ADD CONSTRAINT CK_ppBidID																																														
		CHECK (Len(bidID) = 10)																																													
																																															
ALTER TABLE [Production Plan]																																															
	ADD CONSTRAINT CK_ppVersion																																														
		CHECK (Len(pPlanVersion) = 3)																																													
																																															
ALTER TABLE [Project Team Member]																																															
	ADD CONSTRAINT CK_ptmAssingID																																														
		CHECK (Len(projTeamAssignID) = 10)																																													
																																															
ALTER TABLE [Project Team Member]																																															
	ADD CONSTRAINT CK_ptmPlanVers																																														
		CHECK (Len(pPlanVersion) = 3)																																													
																																															
ALTER TABLE [Project Team Member]																																															
	ADD CONSTRAINT CK_ptmBidID																																														
		CHECK (Len(bidID) = 10)																																													
																																															
ALTER TABLE [Project Team Member]																																															
	ADD CONSTRAINT CK_ptmEmpID																																														
		CHECK (Len(empID) = 10)																																													
																																															
ALTER TABLE [Project Team Member]																																															
	ADD CONSTRAINT CK_ptmLaborCode																																														
		CHECK (Len(laborCode) = 10)																																													
																																															
ALTER TABLE [Tool]																																															
	ADD CONSTRAINT CK_toolCode																																														
		CHECK (Len(toolCode) = 10)																																													
																																															
ALTER TABLE [PP TOOL REQUIREMENTS]																																															
	ADD CONSTRAINT CK_pptrToolCode																																														
		CHECK (Len(toolCode) = 10)																																													
																																															
ALTER TABLE [PP TOOL REQUIREMENTS]																																															
	ADD CONSTRAINT CK_pptrMatID																																														
		CHECK (Len(ppMatID) = 10)																																													
																																															
ALTER TABLE [PP TOOL REQUIREMENTS]																																															
	ADD CONSTRAINT CK_pptrPPlanVers																																														
		CHECK (Len(pPlanVersion) = 3)																																													
																																															
ALTER TABLE [PP TOOL REQUIREMENTS]																																															
	ADD CONSTRAINT CK_pptrBidID																																														
		CHECK (Len(bidID) = 10)																																													
																																															
ALTER TABLE [Production Daily Work Report]																																															
	ADD CONSTRAINT CK_pdwrID																																														
		CHECK (Len(pdwrID) = 10)																																													
																																															
ALTER TABLE [Production Daily Work Report Materials]																																															
	ADD CONSTRAINT CK_pdwrmID																																														
		CHECK (Len(pdwrID) = 10)																																													
																																															
ALTER TABLE [Production Daily Work Report Labor]																																															
	ADD CONSTRAINT CK_pdwrlID																																														
		CHECK (Len(pdwrID) = 10)																																													
																																															
ALTER TABLE [Purchase Order]																																															
	ADD CONSTRAINT CK_poID																																														
		CHECK (Len(poID) = 10)																																													
																																															
ALTER TABLE [Purchase Order]																																															
	ADD CONSTRAINT CK_POsuppID																																														
		CHECK (Len(suppID) = 10)																																													
																																															
ALTER TABLE [Supplier]																																															
	ADD CONSTRAINT CK_suppID																																														
		CHECK (Len(suppID) = 10)																																													
																																															
ALTER TABLE [Purchase Order Materials]																																															
	ADD CONSTRAINT CK_pomID																																														
		CHECK(Len(poID) = 10)																																													
																																															
ALTER TABLE [Purchase Order Materials]																																															
	ADD CONSTRAINT CK_pomMatID																																														
		CHECK (Len(materialID) = 10)																																													
																																															
ALTER TABLE [BID-MATERIALS]																																															
	ADD																																														
		CONSTRAINT FK1_BID_MATERIALS																																													
			FOREIGN KEY (bidID) REFERENCES [DESIGN BID] (bidID);																																												
																																															
ALTER TABLE [BID-MATERIALS]																																															
	ADD																																														
		CONSTRAINT FK2_BID_MATERIALS																																													
			FOREIGN KEY (typeOfMaterial, materialID) REFERENCES [MATERIAL] (typeOfMaterial, materialID);																																												
																																															
																																															
ALTER TABLE [BID-MATERIALS]																																															
ADD CONSTRAINT CHK_BID_MATERIALS_Qty_UnitPrice																																															
CHECK (QtyOnBid > 0 AND UnitPriceForBid > 0);																																															
																																															
ALTER TABLE [BID-LABOR]																																															
ADD CONSTRAINT FK2_BIDLID																																															
FOREIGN KEY (bidID) REFERENCES [DESIGN BID] (bidID)																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															
																																															