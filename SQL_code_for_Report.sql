CREATE DATABASE ELT;
USE ELT;
SELECT * FROM elb_data;
DESCRIBE elb_data;

SELECT COUNT(*) FROM elb_data;

-- 1.	What was the highest-selling product in September?-- 
SELECT `Item Name`, SUM(`Primary Sales`) AS TotalSales
 FROM elb_data 
 WHERE MONTH(`Date`) = 9
 GROUP BY `Item Name`
 ORDER BY TotalSales DESC;
 #LIMIT 1;

-- 2.	Which product had the highest sales for the "CND Chennai" sales team in May? -- 

SELECT `Item Name`, SUM(`Primary Sales`) AS TotalSales
FROM elb_data
WHERE `Sales Team`= 'CND Chennai' AND MONTH(`Date`) = 5
GROUP BY `Item Name`
ORDER BY TotalSales DESC;
 #LIMIT 1;
 
 -- 3.	Which customer had the maximum stock returns in October for the Bangalore HǪ? -- 
 
 SELECT `Customer`, SUM(`Sales Return`) AS TotalReturn FROM elb_data
 WHERE `HQ` = 'HQ-Bangalore' AND MONTH(`Date`) = 10
 GROUP BY `Customer`
 ORDER BY TotalReturn DESC
 LIMIT 1;
 
 # Sales return in October does not exist in elb_data
 
 -- 4.	Which sales team had the maximum percentage of primary sales returned due to expiry? --  
 
 SELECT `Sales Team`, (SUM(`Against Expiry`)/ SUM(`Primary Sales`)) * 100 AS ExpiryReturnPercentage
 FROM elb_data
 GROUP BY `Sales Team`
 ORDER BY ExpiryReturnPercentage DESC
 LIMIT 1; 

  -- 5.	What percentage of overall primary sales was affected by breakage? --  

SELECT (SUM(`Breakage`)/SUM(`Primary Sales`)) *100 AS BreakagePercetage FROM elb_data;

-- 6.	What were the primary sales for the Delhi HǪ in the month of September?-- 

SELECT SUM(`Primary Sales`) AS TotalSales FROM elb_data
WHERE `Sales Team` = 'Elbrit Delhi' AND MONTH(`Date`)=9;

-- 7.	What were the sales of "Britorva 20" in September for PALEPU PHARMA DIST PVT LTD under Coimbatore HǪ? --  

SELECT SUM(`Primary Sales`) AS BritorvaSales FROM elb_data
WHERE `Item Name` = 'BRITORVA 20' AND
	  `Customer` = 'PALEPU PHARMA DIST PVT LTD' AND
      `HQ` = 'HQ-Coimbatore' AND
      MONTH(`Date`) = 9;
      
      
# BONUS

# 1.	What is the forecasted value of primary sales for the October month?
 
SELECT `Date`, SUM(`Primary Sales`) AS ForecastedSales FROM elb_data
	GROUP BY `Date`
    ORDER BY `Date` DESC;

# 2.	Which product had the highest forecasted sales for the "CND Chennai" sales team in November?

SELECT `Item Name`, SUM(`Primary Sales`) AS ForecastedSales FROM elb_data
	WHERE `Sales Team` = 'CND Chennai'
    GROUP BY `Item Name`;


# 3.	What were the forecasted sales of "Britorva 20" in October under Coimbatore HǪ? 

SELECT `Date`, SUM(`Primary Sales`)	AS ForecastedSales FROM elb_data
	WHERE `HQ` = 'HQ-Coimbatore' AND `Item Name`= 'BRITORVA 20'
    GROUP BY `Date`
    ORDER BY `Date`;

