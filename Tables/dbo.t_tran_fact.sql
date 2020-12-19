/*****************************************************************************************************************
NAME:    dbo.t_tran_fact
PURPOSE: Create the dbo.t_tran_fact table

MODIFICATION LOG:
Ver      Date        Author                 Description
-----   ----------   ----------------       -------------------------------------------------------------------------------
1.0     11/11/2020   DOUGLAS MATIAS       1. Built this table for DFNB2 Project 2.

RUNTIME: 
Approx. 0 min

NOTES:
The t_tran_fact table is a fact table that shows each transaction done in the DFNB.
 
******************************************************************************************************************/
-- Drop Table

DROP TABLE [dbo].[t_tran_fact]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_tran_fact](
	[tran_id] [int] IDENTITY(100,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[tran_date] [date] NOT NULL,
	[tran_time] [time](7) NOT NULL,
	[tran_type_id] [smallint] NOT NULL,
	[cur_cust_req_ind] [varchar](1) NOT NULL,
	[tran_amt] [int] NOT NULL,
	[tran_fee_amt] [decimal](15,3) NOT NULL

 CONSTRAINT [PK_t_tran_fact] PRIMARY KEY CLUSTERED 
(
	[tran_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [DFNB2]
GO 
