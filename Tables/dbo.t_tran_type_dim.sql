/*****************************************************************************************************************
NAME:    dbo.t_tran_type_dim
PURPOSE: Create the t_tran_type_dim table

MODIFICATION LOG:
Ver      Date        Author                 Description
-----   ----------   ----------------       -------------------------------------------------------------------------------
1.0     12/16/2020   DOUGLAS MATIAS       1. Built this table for DFNB2 Project 2.

RUNTIME: 
Approx. 0 min

NOTES:
The t_tran_type_dim table is a dimension table that shows the attributes of transactions.
 
******************************************************************************************************************/
-- Drop Table

DROP TABLE [dbo].[t_tran_type_dim]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_tran_type_dim](
	[tran_type_id] [smallint] NOT NULL,
	[tran_type_code] [varchar](5) NOT NULL,
	[tran_type_desc] [varchar](100) NOT NULL,
	[tran_fee_prct] [decimal](4,3) NOT NULL
	
) ON [PRIMARY]
GO 
