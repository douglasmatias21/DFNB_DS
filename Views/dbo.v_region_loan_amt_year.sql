USE [DFNB2];
GO

/****** Object:  View [dbo].[v_region_loan_amt_year]    Script Date: 12/16/2020 09:34134 ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE VIEW dbo.v_region_loan_amt_year
AS
     SELECT a.branch_id
          , b.branch_name
          , b.region_id
          , r.acct_area_id
          , YEAR(open_date) AS 'year'
          , SUM(loan_amt) AS 'Total Loan Amount'
       FROM dbo.t_acct_dim AS a
            INNER JOIN
            dbo.t_branch_dim AS b ON a.branch_id = b.branch_id
            INNER JOIN
            dbo.t_region_dim AS r ON b.region_id = r.acct_region_id
      WHERE YEAR(open_date) IN
                              (
                               2016
                             , 2017
                             , 2018
                             , 2019
                              )
      GROUP BY a.branch_id
             , b.branch_name
             , b.region_id
             , r.acct_area_id
             , YEAR(open_date);
--	ORDER BY branch_id,
--	YEAR(open_date);
GO