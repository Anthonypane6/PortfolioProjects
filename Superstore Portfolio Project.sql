--Tables

SELECT *
FROM PortfolioProject..Orders$

SELECT * 
FROM PortfolioProject..People$

SELECT * 
FROM PortfolioProject..Returns$



--Using A JOIN To Remove Returned Products

SELECT *
FROM PortfolioProject..Orders$ ord
LEFT JOIN PortfolioProject..Returns$ ret
	ON ord.Order_ID=ret.Order_ID
WHERE Returned is null


--Total Region Profit Without Returns Included 

SELECT Region, SUM(Profit) AS Region_Profit
FROM PortfolioProject..Orders$ ord
LEFT JOIN PortfolioProject..Returns$ ret
	ON ord.Order_ID=ret.Order_ID
WHERE ret.Returned is null
GROUP BY ord.Region

--Profit Ratio By Region

SELECT Region, SUM(Profit)/SUM(Sales)*100 as Profit_Ratio
FROM PortfolioProject..Orders$ ord
LEFT JOIN PortfolioProject..Returns$ ret
	ON ord.Order_ID=ret.Order_ID
WHERE ret.Returned is null
GROUP BY ord.Region

--Profit Ratio By State

SELECT ord.State, SUM(Profit)/SUM(Sales)*100 as Profit_Ratio
FROM PortfolioProject..Orders$ ord
LEFT JOIN PortfolioProject..Returns$ ret
	ON ord.Order_ID=ret.Order_ID
WHERE ret.Returned is null
GROUP BY ord.State
ORDER BY 1


--Finding The Most Profitable Products

SELECT ord.Product_Name, COUNT(ord.Product_Name) as Products_Sold, SUM(Profit)/SUM(Sales)*100 as Profit_Ratio
FROM PortfolioProject..Orders$ ord
LEFT JOIN PortfolioProject..Returns$ ret
	ON ord.Order_ID=ret.Order_ID
WHERE ret.Returned is null
GROUP BY ord.Product_Name
ORDER BY 3 DESC

--Finding The Most Profitable Customer Segments

SELECT ord.Segment, SUM(Profit)/SUM(Sales)*100 as Profit_Ratio
FROM PortfolioProject..Orders$ ord
LEFT JOIN PortfolioProject..Returns$ ret
	ON ord.Order_ID=ret.Order_ID
WHERE ret.Returned is null
GROUP BY ord.Segment
ORDER BY 2 DESC

--Finding The Most Profitable Categories

SELECT ord.Category, SUM(Profit)/SUM(Sales)*100 as Profit_Ratio
FROM PortfolioProject..Orders$ ord
LEFT JOIN PortfolioProject..Returns$ ret
	ON ord.Order_ID=ret.Order_ID
WHERE ret.Returned is null
GROUP BY ord.Category
ORDER BY 2 DESC