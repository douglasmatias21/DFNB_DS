
----Q1: By Order Quantity, what were the five most popular products sold in 2014?

SELECT TOP 5 YEAR(soh.OrderDate) AS OrderDateYear
		   , p.productID
		   , p.Name AS ProductName
		   , p.ProductNumber
		   , p.Color AS ProductColor
		   , Count(sod.SalesOrderID) AS SalesORderIDCount
		   , SUM(sod.OrderQty) AS OrderQtySum
		   , SUM(sod.LineTotal) AS SalesORderLineTotalSum

   FROM Production.Product AS p
   INNER JOIN	
   Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
   INNER JOIN	
   Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
   WHERE YEAR(soh.OrderDate) = 2014
   GROUP BY YEAR(soh.OrderDate)
		  , p.ProductID
		  , p.name
		  , p.productNumber
		  , p.Color
	ORDER BY 7 DESC



--
--Q2: How long are the 7 longest Person names and to whom do they belong? Rank by Full Name length, Last Name Length, First Name Length
SELECT TOP 7 p.businessEntityID
		   , REPLACE(COALESCE(p.firstname,'')+ ' ' + COALESCE(p.MiddleName, '') +
			 ' ' + COALESCE(p.LastName, ''), '  ', ' ')AS FullName
		   , LEN(REPLACE(COALESCE(p.FirstName, '') + ' ' + COALESCE(p.MiddleName,''
		    ) + ' ' + COALESCE(p.LastName, ''), '  ',' ')) AS FullNameLenght
		   , p.FirstName
		   , LEN(p.FirstName) AS FirstNameLenght
		   , p.MiddleName
		   , p.LastName
		   , LEN(p.LastName) AS LastNamelenght
FROM Person.Person AS p
ORDER BY 3 DESC
	   , 8 DESC
	   , 5 DESC;




--Q3: Which Department pays its female workers on average the most per year?


--Department ID
--Department Name D
--Gender E
--Total Yearly Pay
--Business Entity ID Count EDH
--Average Yearly Pay EPH
with s1  as(
select d.departmentID
	 , d.Name as departmentName
	 , e.Gender
	 , eph.Rate
	 , eph.PayFrequency
	 ,e.salariedflag
	 , case 
		   when e.salariedFlag = 1
		   then rate * 1000
		   when e.salariedFlag = 0
		   then rate * 2000
		   else 0
		end as yearly_pay

	 , count(e.businessEntityID) AS businessEntityIDCount
	 , case
		   when e.salariedFlag = 1
		   then rate * 1000
		   when e.salariedFlag = 0
		   then rate * 2000
		   else 0
		end * count(e.businessEntityID) as TotalYearlyPay
	from humanResources.employee as e
		inner join
		humanResources.EmployeeDepartmentHistory as edh on 
		e.businessEntityID = edh.businessEntityID 
		inner join
		humanResources.employeepayhistory AS eph ON
		edh.businessEntityID = eph.businessEntityID 
		inner join
		humanResources.department AS d ON
		edh.departmentID = d.departmentID 
	where e.gender = 'F'
	Group by d.departmentID
	 , d.Name 
	 , e.Gender
	 , eph.Rate
	 , eph.PayFrequency
	 , e.salariedFlag
	 , case 
		   when e.salariedFlag = 1
		   then rate * 1000
		   when e.salariedFlag = 0
		   then rate * 2000
		   else 0
		end )
select top 10 s1.departmentID
		  , s1.departmentName
		  , s1.	gender
		  , SUM(s1.TotalYearlyPay) as TotalYearlyPay
		  , SUM(s1.businessEntityIDCount) as businessEntityIDCount
		  , SUM(S1.totalyearlypay) / sum(s1.businessEntityIDCount) as
			averageyearlypay
 from s1
group by  s1.departmentID
		, s1.departmentName
		, s1.Gender
order by 6 desc

