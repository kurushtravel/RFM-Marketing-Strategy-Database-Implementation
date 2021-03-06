
/****** Object:  StoredProcedure [dbo].[spRFMSummary]    Script Date: 6/19/2021 10:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[spRFMSummary]   
    @FromDate int,   
    @ToDate  int,
	@WhereClause  nvarchar(256)
	
AS   
BEGIN
    SET NOCOUNT ON;
	WITH SALE_COUNT AS
		(SELECT 
				D.USERID,
			    ISNULL(D.[2016],0) AS 'COUNT_2016',
			    ISNULL(D.[2017],0) AS 'COUNT_2017',
			    ISNULL(D.[2018],0) AS 'COUNT_2018',
			    ISNULL(D.[2019],0) AS 'COUNT_2019',
				ISNULL(D.[2020],0) AS 'COUNT_2020',
			    ISNULL(D.[2019],0) + ISNULL(D.[2020],0) AS COUNT_2_YEAR,
				ISNULL(D.[2018],0) + ISNULL(D.[2019],0) + ISNULL(D.[2020],0) AS COUNT_3_YEAR,
				ISNULL(D.[2016],0) + ISNULL(D.[2017],0) + ISNULL(D.[2018],0) + ISNULL(D.[2019],0) + ISNULL(D.[2020],0) AS COUNT_5_YEAR
		FROM 
			(SELECT * FROM
				(SELECT 
					I.USERID,
					SUBSTRING(CAST(I.DATE AS varchar),1,4)AS YEAR,
					CAST(I.Payable AS bigint) AS PAYABLE
					FROM Invoice I JOIN Profile P ON P.UserId = I.UserId
					WHERE      
						I.Status <>'Annuled'
						)T
				PIVOT
				(count(PAYABLE)  FOR YEAR IN ([2016],[2017],[2018],[2019],[2020])
					)AS PIVOT_TABLE
			)D
		)
		,SALE_SUM AS
		(
		SELECT  D.USERID,
				ISNULL(D.[2016],0) AS 'SUM_2016',
				ISNULL(D.[2017],0) AS 'SUM_2017',
				ISNULL(D.[2018],0) AS 'SUM_2018',
			    ISNULL(D.[2019],0) AS 'SUM_2019',
			    ISNULL(D.[2020],0) AS 'SUM_2020',
			    ISNULL(D.[2019],0) + ISNULL(D.[2020],0) AS SUM_2_YEAR,
				ISNULL(D.[2018],0) + ISNULL(D.[2019],0) + ISNULL(D.[2020],0) AS SUM_3_YEAR,
				ISNULL(D.[2016],0) + ISNULL(D.[2017],0) + ISNULL(D.[2018],0) + ISNULL(D.[2019],0) + ISNULL(D.[2020],0) AS SUM_5_YEAR
	    FROM 
			(SELECT * FROM
				(SELECT 
					I.USERID,
					SUBSTRING(CAST(I.DATE AS varchar),1,4) AS YEAR,
					CAST(I.Payable AS bigint) AS PAYABLE
					FROM Invoice I JOIN Profile P ON P.UserId = I.UserId
					WHERE      
						I.Status <>'Annuled'
				)T
				PIVOT
				(SUM(PAYABLE)  FOR YEAR IN ([2016],[2017],[2018],[2019],[2020])
				)AS PIVOT_TABLE
			)D
		)
		,ALLUSER_DATE AS
		(
		SELECT  
				I.UserId,
				COUNT(I.PAYABLE) AS COUNT_Order,
				SUM(CAST(I.Payable AS bigint))  SUM_Amount,
				MIN(I.DATE) AS First_Order_Date,
				MAX(I.DATE) AS Last_Order_Date,
				AVG(CAST(I.Payable AS bigint)) as AVG_Amount,
				DATEDIFF( day, dbo.PersianToGregorian(cast(MAX(I.DATE) as varchar)),SYSDATETIMEOFFSET()) AS DIFF_DAYS				

		FROM Invoice I JOIN Profile P ON P.UserId = I.UserId
		WHERE 
			I.Status <>'Annuled'
  		GROUP BY  I.USERID 
		)
		,RFM_DATA AS
		(
		SELECT 
			A.UserId,
			CASE 
				WHEN A.DIFF_DAYS > 100 THEN 1
				WHEN A.DIFF_DAYS BETWEEN 61 AND 100 THEN 2
				WHEN A.DIFF_DAYS BETWEEN 36 AND 60 THEN	3
				WHEN A.DIFF_DAYS BETWEEN 16 AND 35 THEN	4
				WHEN A.DIFF_DAYS <= 15 THEN	5
			END AS R,
			CASE 
				WHEN A.COUNT_Order < 3 THEN 1
				WHEN A.COUNT_Order BETWEEN 3 AND 6 THEN	2
				WHEN A.COUNT_Order BETWEEN 7 AND 9 THEN 3
				WHEN A.COUNT_Order BETWEEN 10 AND 14 THEN 4
				WHEN A.COUNT_Order >= 15 THEN 5
			END AS F,
				
			CASE 
				WHEN A.SUM_Amount <= 1500000 THEN 1
				WHEN A.SUM_Amount BETWEEN 1500000 AND 5000000 THEN 2
				WHEN A.SUM_Amount BETWEEN 5000000 AND 10000000 THEN	3
				WHEN A.SUM_Amount BETWEEN 10000000 AND 15000000 THEN 4
				WHEN A.SUM_Amount >= 15000000 THEN 5
			END AS M
		
	FROM 	ALLUSER_DATE A
	
	)
	,RFM AS
	(
	SELECT 
	      T.USERID,
		  T.R,
		  T.F,
		  T.M,
		  T.R*100 + T.F*10 + T.M AS RFM,
		  G.Segment
	FROM  RFM_DATA T
		  JOIN Segment G ON G.RFM = T.R*100 + T.F*10 + T.M
	)
	,RFM_PERCENT AS
	(SELECT 
		R.Segment,
		ROUND(( CAST((COUNT(R.Segment)*100) AS FLOAT)/CAST((SELECT COUNT(*) FROM RFM T)AS FLOAT)),2) AS Segment_PERCENT
	FROM RFM R
	GROUP BY R.Segment
	)
		SELECT 
			   C.UserId ,     -- AS  'Customer Code',
			   P.Surename,    -- AS  'Customer Name',
			   P.Mobile,      -- AS  'Customer Mobile',
			   C.COUNT_2016 , -- AS  'Purchase Count In Year 2016',
			   C.COUNT_2017 , -- AS  'Purchase Count In Year 2017',
			   C.COUNT_2018 , -- AS  'Purchase Count In Year 2018',
			   C.COUNT_2019,  -- AS  'Purchase Count In Year 2019',
			   C.COUNT_2020 , -- AS  'Purchase Count In Year 2020',
			   COUNT_2_YEAR,  -- AS  'Purchase Count In Last 2 Year',
			   COUNT_3_YEAR,  -- AS  'Purchase Count In Year 3 Year',
			   COUNT_5_YEAR,  -- AS  'Purchase Count In Year 5 Year',
			   S.SUM_2016,    -- AS  'Purchase Sum In Year 2016',
			   S.SUM_2017,    -- AS  'Purchase Sum In Year 2017',
			   S.SUM_2018,    -- AS  'Purchase Sum In Year 2018',
			   S.SUM_2019,    -- AS  'Purchase Sum In Year 2019',
			   S.SUM_2020,    -- AS  'Purchase Sum In Year 2020',
			   SUM_2_YEAR,    -- AS  'Purchase Sum In Last 2 Year',
			   SUM_3_YEAR,    -- AS  'Purchase Sum In Last 3 Year',
			   SUM_5_YEAR,    -- AS  'Purchase Sum In Last 5 Year',
			   A.Sum_amount,  -- AS  'Purchase Sum',
			   A.COUNT_Order,  -- AS 'Purchase Count',
			   A.Last_Order_Date,  --  AS  'Last Order Date',
			   A.DIFF_DAYS,--   AS  'Days Difference',
			   A.First_Order_Date ,--   AS  'First Order Date',
			   ISNULL(SUBSTRING(CAST(A.Last_Order_Date AS VARCHAR),1,4),'No Order') AS Last_Order_Year,--'Last Order Year',
			   CASE WHEN SUBSTRING(CAST(A.Last_Order_Date AS varchar) ,1,4) = '2020' THEN
					CAST(A.Last_Order_Date AS VARCHAR)
				ELSE
					'NOT ORDERED'
					END
				AS Last_Order_Date2020,--'Last Order Date 2020',
			   CASE WHEN (C.COUNT_2020) IS NOT NULL OR (C.COUNT_2020)<> 0  AND S.SUM_2020 IS NOT NULL THEN
					ISNULL((S.SUM_2020/NULLIF(C.COUNT_2020,0)),0) 
			   END AS AVG_AMOUNT2020,--'Purchase Avarage Amount 2020',
				R.RFM,
				R.R,
				R.F,
				R.M,
				T.SEGMENT,
				T.Segment_PERCENT
		FROM 
			SALE_COUNT C JOIN SALE_SUM S ON C.UserId=S.UserId
			JOIN Profile P ON P.UserId = C.UserId
			JOIN ALLUSER_DATE A ON A.UserId = C.UserId
			JOIN RFM R ON R.UserId = C.UserId
			JOIN RFM_PERCENT T ON T.Segment =  R.Segment
		ORDER BY  T.Segment_PERCENT
						
END;
