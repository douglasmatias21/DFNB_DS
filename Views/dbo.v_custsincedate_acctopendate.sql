
/*****************************************************************************************************************
NAME:    dbo.v_custsincedate_acctopendate
PURPOSE: Create the dbo.v_custsincedate_acctopendate view

MODIFICATION LOG:
Ver      Date        Author                Description
-----   ----------   ----------------      -------------------------------------------------------------------------------
1.0     12/15/2020   DOUGLAS MATIAS       1. Built this table for IT240 DFNB Project1


RUNTIME: 
0 min

NOTES:
This view shows the initial relationship between t_cust_dim and DFNB and the open dates for their t_acct_dim.

******************************************************************************************************************/

CREATE VIEW dbo.v_custsincedate_acctopendate
AS
SELECT c.cust_id
     , c.cust_since_date
     , ac.acct_id
     , ac.open_date
  FROM dbo.t_cust_dim AS c
       INNER JOIN
       dbo.t_acct_dim AS ac ON c.cust_id = ac.pri_cust_id
 GROUP BY c.cust_id
        , c.cust_since_date
        , ac.acct_id
        , ac.open_date;

SELECT *  FROM dbo.t_acct_dim c

GO 


