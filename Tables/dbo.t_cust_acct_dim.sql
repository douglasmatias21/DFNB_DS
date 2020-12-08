/*****************************************************************************************************************
NAME:    dbo.Customers_Accounts
PURPOSE: Create the dbo.Customers_Accounts table

MODIFICATION LOG:
Ver      Date        Author                 Description
-----   ----------   ----------------       -------------------------------------------------------------------------------
1.0     12/15/2020   DOUGLAS MATIAS       1. Built this table for DFNB2 Project 1


RUNTIME: 
Approx. 0 min

NOTES:
The Customers_Accounts is a link table to solve the many-to-many relationships between Customers table and Accounts table.
 
******************************************************************************************************************/
-- Drop Table

USE [DFNB2]
GO

/****** Object:  Table [dbo].[Customers_Accounts]    Script Date: 26/10/2020 18:53:34 ******/
DROP TABLE [dbo].[Customers_Accounts]
GO

/****** Object:  Table [dbo].[Customers_Accounts]    Script Date: 26/10/2020 18:53:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers_Accounts](
	[acct_cust_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_Customers_Accounts] PRIMARY KEY CLUSTERED 
(
	[acct_cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [DFNB2]
GO

/****** Object:  Index [APK_Customers_Accounts]    Script Date: 26/10/2020 19:01:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [APK_Customers_Accounts] ON [dbo].[Customers_Accounts]
(
	[acct_id] ASC,
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



