USE [DFNB2];
GO

/****** Object:  View [dbo].[v_tran_count_cust]    Script Date: 12/18/2020 12:15:45 ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO


/*****************************************************************************************************************
NAME:    dbo.v_tran_count_cust
PURPOSE: Create the v_tran_count_cust view

MODIFICATION LOG:
Ver      Date        Author                Description
-----   ----------   ----------------      -------------------------------------------------------------------------------
1.0     12/18/2020   DOUGLAS MATIAS       1. Built this table for IT240 DFNB Project2


RUNTIME: 
0 min

NOTES:
This view shows the count of transactions with respective customers attributes.

******************************************************************************************************************/

CREATE VIEW dbo.v_tran_count_cust
AS
     SELECT a.pri_cust_id
          , a.acct_id
          , t.branch_id
          , b.branch_name
          , COUNT(t.tran_id) AS 'Count of transactions'
          , d.tran_type_desc
       FROM DFNB2.dbo.t_tran_fact AS t
            INNER JOIN
            dbo.t_branch_dim AS b ON t.branch_id = b.branch_id
            INNER JOIN
            dbo.t_acct_dim AS a ON a.branch_id = b.branch_id
            INNER JOIN
            dbo.t_tran_type_dim AS d ON t.tran_type_id = d.tran_type_id
      GROUP BY a.pri_cust_id
             , a.acct_id
             , t.branch_id
             , b.branch_name
             , d.tran_type_desc;
GO 
