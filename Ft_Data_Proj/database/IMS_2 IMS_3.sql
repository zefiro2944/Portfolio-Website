--								IMS_2
SELECT P.materialID
	, M.[description]
	, CONCAT(P.size, P.sizeUnits) AS [Size]
	, po.poDate AS [Last Ordered]
	, POM.extPrice AS [Price]
	, P.quantityinStock AS [QIS]
	, BM.QtyOnBid AS [IS/OB]
	, COUNT(POM.materialID) AS [QOO]
	, BM.QtyOnBid AS [OO/OB]

FROM PLANT P FULL JOIN MATERIAL M
	ON P.materialID = M.materialID
	JOIN [Purchase Order Materials] POM
	ON P.materialID = POM.materialID
	JOIN [Purchase Order] PO 
	ON POM.poID = PO.poID
	JOIN [BID-MATERIALS] BM
	ON P.materialID = BM.materialID

GROUP BY P.materialID, M.description, P.size, P.sizeUnits, PO.poDate, POM.extPrice, BM.QtyOnBid, P.quantityinStock

SELECT P.materialID
	, M.[description]
	, CONCAT(P.size, P.sizeUnits) AS [Size]
	, po.poDate AS [Last Ordered]
	, POM.extPrice AS [Price]
	, P.quantityinStock AS [QIS]
	, BM.QtyOnBid AS [IS/OB]
	, COUNT(POM.materialID) AS [QOO]
	, BM.QtyOnBid AS [OO/OB]

FROM POTTERY P JOIN MATERIAL M
	ON P.materialID = M.materialID
	JOIN [Purchase Order Materials] POM
	ON P.materialID = POM.materialID
	JOIN [Purchase Order] PO 
	ON POM.poID = PO.poID
	JOIN [BID-MATERIALS] BM
	ON P.materialID = BM.materialID

GROUP BY P.materialID, M.description, P.size, P.sizeUnits, PO.poDate, POM.extPrice, BM.QtyOnBid, P.quantityinStock

SELECT OM.materialID
	, M.[description]
	, CONCAT(OM.size, OM.sizeUnits) AS [Size]
	, po.poDate AS [Last Ordered]
	, POM.extPrice AS [Price]
	, OM.quantityinStock AS [QIS]
	, BM.QtyOnBid AS [IS/OB]
	, COUNT(POM.materialID) AS [QOO]
	, BM.QtyOnBid AS [OO/OB]

FROM [OTHER MATERIAL] OM FULL JOIN MATERIAL M
	ON OM.materialID = M.materialID
	JOIN [Purchase Order Materials] POM
	ON OM.materialID = POM.materialID
	JOIN [Purchase Order] PO 
	ON POM.poID = PO.poID
	JOIN [BID-MATERIALS] BM
	ON OM.materialID = BM.materialID

GROUP BY OM.materialID, M.description, OM.size, OM.sizeUnits, PO.poDate, POM.extPrice, BM.QtyOnBid, OM.quantityinStock

--          IMS_3

SELECT M.[description]
	, CONCAT(P.SIZE, P.sizeUnits) AS [Size]
	, SUM(POM.matQty) AS [Sales/Year]
	, PO.suppID
FROM PLANT P JOIN [Purchase Order Materials] POM
	ON P.materialID = POM.materialID
	JOIN MATERIAL M ON P.materialID = M.materialID
	JOIN [Purchase Order] PO ON POM.poID = PO.poID
WHERE YEAR(PO.poDate) = YEAR(GETDATE())
GROUP BY M.[description], PO.suppID, P.size, P.sizeUnits
