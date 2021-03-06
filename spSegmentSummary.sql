/****** Object:  StoredProcedure [dbo].[spSegmentSummary]    Script Date: 6/19/2021 10:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE  [dbo].[spSegmentSummary]   
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
						--@WhereClause +
						I.Status <>'Annuled'
						--AND (I.DATE) BETWEEN  + @FromDate  and + @ToDate
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
						--@WhereClause +
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
				--SUM(CAST(I.Payable AS bigint))/COUNT(I.PAYABLE) AS AVGGG,
				MIN(I.DATE) AS First_Order_Date,
				MAX(I.DATE) AS Last_Order_Date,
				AVG(CAST(I.Payable AS bigint)) as AVG_Amount,
				DATEDIFF( day, dbo.PersianToGregorian(cast(MAX(I.DATE) as varchar)),SYSDATETIMEOFFSET()) AS DIFF_DAYS				

		FROM Invoice I JOIN Profile P ON P.UserId = I.UserId
		WHERE 
			--@WhereClause +
			I.Status <>'Annuled'
  		GROUP BY  I.USERID 
		--HAVING    MAX(I.DATE)  BETWEEN 13951001 and 20191230
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
	      T.USERID,T.R,T.F,T.M,T.R*100 + T.F*10 + T.M AS RFM,G.Segment
	FROM  RFM_DATA T  JOIN Segment G ON G.RFM = T.R*100 + T.F*10 + T.M
	)
	,RFM_PERCENT AS
	(SELECT 
		R.Segment,
		ROUND(( CAST((COUNT(R.Segment)*100) AS FLOAT)/CAST((SELECT COUNT(*) FROM RFM T)AS FLOAT)),2) AS Segment_Percentage
	FROM RFM R
	GROUP BY R.Segment
	)
		SELECT 
			T.SEGMENT,
			T.Segment_Percentage
		FROM 
			RFM_PERCENT T 
		ORDER BY  T.Segment_Percentage
						
END;
