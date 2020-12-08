/*****************************************************************************************************************
NAME:    dbo.t_acct_fact
PURPOSE: Create the dbo.t_acct_fact table

MODIFICATION LOG:
Ver      Date        Author                 Description
-----   ----------   ----------------       -------------------------------------------------------------------------------
1.0     11/24/2020   DOUGLAS MATIAS       1. Built this table for DFNB2 Project 1
1.1		12/15/2020	 DOUGLAS MATIAS		2. Table was renamed.

RUNTIME: 
Approx. 0 min

NOTES:
The t_acct_fact table is a fact table that shows each account balance in a given time.
 
******************************************************************************************************************/
-- Drop Table

DROP TABLE [dbo].[t_cust_branch_dim]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_cust_branch_dim](
	  [cust_id] [smallint] NOT NULL
	  ,[acct_id] [int] NOT NULL
      ,[pri_branch_id] [smallint] NOT NULL
      ,[cust_pri_branch_dist] [decimal](7, 2) NOT NULL
	  CONSTRAINT PK_Person PRIMARY KEY (cust_id,acct_id)

	
) ON [PRIMARY]
GO