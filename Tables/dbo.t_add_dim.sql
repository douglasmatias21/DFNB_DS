/*****************************************************************************************************************
NAME:    dbo.t_acct_fact
PURPOSE: Create the dbo.t_acct_fact table

MODIFICATION LOG:
Ver      Date        Author                 Description
-----   ----------   ----------------       -------------------------------------------------------------------------------
1.0     11/24/2020   DOUGLAS MATIAS       1. Built this table for DFNB2 Project 1
1.1		11215/2020	 DOUGLAS MATIAS		2. Table was renamed.

RUNTIME: 
Approx. 0 min

NOTES:
The t_acct_fact table is a fact table that shows each account balance in a given time.
 
******************************************************************************************************************/
-- Drop Table

DROP TABLE [dbo].[t_add_dim]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


	WITH sp
     AS (SELECT acct_branch_add_id AS add_id, acct_branch_add_type AS add_type, sp.acct_branch_lat AS lat, sp.acct_branch_lon AS lon FROM dbo.stg_p1 AS sp
         UNION
         SELECT cust_add_id, sp.cust_add_type, sp.cust_add_lat, sp.cust_add_lon FROM dbo.stg_p1 AS sp)
     SELECT *
     INTO t_add_dim
       FROM sp;


-- Version 1 of the create table script.

--CREATE TABLE [dbo].[t_add_dim](
--	[acct_branch_add_id] [int] NOT NULL,
--	[acct_branch_add_lat] [decimal](16, 12) NOT NULL,
--	[acct_branch_add_lon] [decimal](16, 12) NOT NULL,
--	[acct_branch_add_type] [varchar](1) NOT NULL,
--	[cust_add_id] [int] NOT NULL,
--	[cust_add_lat] [decimal](16, 12) NOT NULL,
--	[cust_add_lon] [decimal](16, 12) NOT NULL,
--	[cust_add_type] [varchar](1) NOT NULL,