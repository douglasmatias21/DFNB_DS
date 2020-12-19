/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [branch_id]
      ,[Account_Qtd_by_Branch]
      ,[Loan_Amount]
      ,[Year]
  FROM [DFNB2].[dbo].[Vbranch]