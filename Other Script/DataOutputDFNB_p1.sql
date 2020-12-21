/*****************************************************************************************************************
NAME:    DataOutputDFNB_p1
PURPOSE: Create the output for all views created on project 01
SUPPORT: Jaussi Consulting LLC
		 www.jaussiconsulting.net
		 jon@jaussiconsulting.net
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/17/2020   DOUGLAS MATIAS  1. Creation of the Script for output
 
RUNTIME: 
Approx. 1 min
NOTES:
Creating of the script to run all views at once.
******************************************************************************************************************/

SELECT *
  FROM dbo.v_balance_on_dec;

SELECT *
  FROM dbo.v_customers_branches;

SELECT *
  FROM dbo.v_custsincedate_acctopendate;

SELECT *
  FROM dbo.v_tran_count_cust;

