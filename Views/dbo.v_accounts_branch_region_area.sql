
/*****************************************************************************************************************
NAME:    dbo.v_t_acct_dim_branch_region_area
PURPOSE: Create the dbo.v_t_acct_dim_branch_region_area view

MODIFICATION LOG:
Ver      Date        Author                Description
-----   ----------   ----------------      -------------------------------------------------------------------------------
1.0     12/15/2020   DOUGLAS MATIAS       1. Built this table for IT240 DFNB Project2

RUNTIME: 
0 min

NOTES:
This view shows the number of t_acct_dim per t_branch_dim, t_region_dim, and t_area_dim.

******************************************************************************************************************/

CREATE VIEW dbo.v_t_acct_dim_branch_region_area_year
AS
     SELECT COUNT(ac.acct_id) AS 'Number of t_acct_dim'
          , b.branch_id
          , r.acct_region_id
          , a.acct_area_id
		  , d.as_of_date
       FROM dbo.t_acct_dim AS ac
            INNER JOIN
            dbo.t_branch_dim AS b ON ac.branch_id = b.branch_id
            INNER JOIN
            dbo.t_region_dim AS r ON b.region_id = r.acct_region_id
            INNER JOIN
            dbo.t_area_dim AS a ON r.acct_area_id = a.acct_area_id
			INNER JOIN
			dbo.t_acct_fact d ON d.acct_id = ac.acct_id
      GROUP BY b.branch_id
             , r.acct_region_id
             , a.acct_area_id
			 , d.as_of_date;

--SELECT * FROM t_acct_dim_branch_region_area
