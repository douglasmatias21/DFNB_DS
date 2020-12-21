/*****************************************************************************************************************
NAME:    LoadDFNB P2
PURPOSE: Load DFNB Project 2 

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/16/2020   DOUGLAS MATIAS    1. Load DFNB Project2.

RUNTIME: 
Approx. 1 min

NOTES:
This script will load the data from dbo.stg_p2 to the tables on DFNB database.

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

-- 1) Create the t_acct_dim table

--DROP TABLE [dbo].[t_tran_type_dim]
--GO
--SELECT DISTINCT
	--[tran_type_id] [smallint] NOT NULL,
	--[tran_type_code] [varchar](5) NOT NULL,
	--[tran_type_desc] [varchar](100) NOT NULL,
	--[tran_fee_prct] [decimal](4,3) NOT NULL
--  INTO [dbo].[t_tran_type_dim]
--  FROM dbo.stg_p2 stg
-- ORDER BY tran_type_id;

-- 1.1) Load table t_tran_type_dim

TRUNCATE TABLE dbo.t_tran_type_dim;

INSERT INTO dbo.t_tran_type_dim
SELECT DISTINCT 
	[tran_type_id],
	[tran_type_code],
	[tran_type_desc],
	[tran_fee_prct]
  FROM dbo.stg_p2 AS stg
 ORDER BY tran_type_id;
 

-- 2) Create the t_tran_fact table

--CREATE TABLE [dbo].[t_tran_fact](
--	[tran_id] [int] IDENTITY(100,1) NOT NULL,
--	[acct_id] [int] NOT NULL,
--	[branch_id] [smallint] NOT NULL,
--	[tran_date] [date] NOT NULL,
--	[tran_time] [time](7) NOT NULL,
--	[tran_type_id] [smallint] NOT NULL,
--	[cur_cust_req_ind] [varchar](1) NOT NULL,
--	[tran_amt] [int] NOT NULL,
--	[tran_fee_amt] [decimal](15,3) NOT NULL

-- CONSTRAINT [PK_t_tran_fact] PRIMARY KEY CLUSTERED 
--(
--	[tran_id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO

-- 2.1) Load dbo.t_tran_fact.sql

TRUNCATE TABLE dbo.t_tran_fact;

INSERT INTO dbo.t_tran_fact
SELECT DISTINCT 
       acct_id
     , branch_id
     , tran_date
     , tran_time
     , tran_type_id
     , cur_cust_req_ind
     , tran_amt
     , tran_fee_amt
  FROM dbo.stg_p2 AS stg
 ORDER BY acct_id;
