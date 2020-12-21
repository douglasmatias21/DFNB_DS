
/*****************************************************************************************************************
NAME:    dbo.v_t_cust_dim_t_branch_dim
PURPOSE: Create the dbo.v_custsincedate_acctopendate view

MODIFICATION LOG:
Ver      Date        Author                Description
-----   ----------   ----------------      -------------------------------------------------------------------------------
1.0     12/15/2020   DOUGLAS MATIAS        1. Built this table for IT240 DFNB Project1


RUNTIME: 
0 min

NOTES:
This view shows lists the t_cust_dim and their primary branch.

******************************************************************************************************************/
CREATE VIEW dbo.v_t_cust_dim_branch AS
SELECT cust_id
     , pri_branch_id
     , cust_since_date
     , branch_name
  FROM DFNB2.dbo.t_cust_dim AS c
       INNER JOIN
       dbo.t_branch_dim AS b ON b.branch_id = c.pri_branch_id;  
