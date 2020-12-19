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

DROP TABLE [dbo].[t_prod_dim]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_prod_dim](
	[prod_id] [smallint] NOT NULL,
	[prod_name] [varchar] (100) NULL,
	[prod_open_date] [date] NULL,
	[prod_close_date] [date] NULL,
		
) ON [PRIMARY]
GO
