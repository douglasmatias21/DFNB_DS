/*****************************************************************************************************************
NAME:    dbo.t_acct_dim
PURPOSE: Create the dbo.t_acct_dim table

MODIFICATION LOG:
Ver      Date        Author                 Description
-----   ----------   ----------------       -------------------------------------------------------------------------------
1.0     11/24/2020   DOUGLAS MATIAS      1. Built this table for DFNB2 Project 1
1.1		12/018/2020	 DOUGLAS MATIAS		2. Table was renamed.

RUNTIME: 
Approx. 0 min

NOTES:
The t_acct_dim table is a Dimension table with the t_acct_dim' attributes.
 
******************************************************************************************************************/
-- Drop Table



CREATE TABLE [dbo].[t_acct_dim](
	[acct_id] [int] NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[pri_cust_id] [smallint] NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	
) ON [PRIMARY]
GO 
 
 
