/*****************************************************************************************************************
NAME:    LoadDFNB_p1
PURPOSE: Load DFNB Project 1 

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/15/2020   DOUGLAS MATIAS    1. Load DFNB Project1
1.1     11/19/2020   DOUGLAS MATIAS    1.1 Rebuid the repository

RUNTIME: 
Approx. 1 min

NOTES:
This script will load the data from dbo.stg_p1 to the tables on DFNB database.

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

-- 1) Create the t_acct_dim table

--SELECT DISTINCT
--	[acct_id] [int] NOT NULL,
--	[prod_id] [smallint] NOT NULL,
--	[open_date] [date] NOT NULL,
--	[close_date] [date] NOT NULL,
--	[branch_id] [smallint] NOT NULL,
--	[pri_cust_id] [smallint] NOT NULL,
--	[loan_amt] [decimal](20, 4) NOT NULL
--  INTO dbo.t_acct_dim
--  FROM dbo.stg_p1 stg
-- ORDER BY acct_id;

-- 1.1) Load dbo.t_acct_dim.sql

TRUNCATE TABLE dbo.t_acct_dim;

INSERT INTO dbo.t_acct_dim
SELECT DISTINCT 
       acct_id
     , prod_id
     , open_date
     , close_date
     , branch_id
     , pri_cust_id
     , loan_amt
  FROM dbo.stg_p1 AS stg
 ORDER BY acct_id;
 



-- 2) Create the t_acct_fact table

--CREATE TABLE [dbo].[t_acct_fact](
--	 [acct_id] [int] NOT NULL,
--	 [as_of_date] [date] NOT NULL,
--	 [cur_bal] [decimal](20, 4) NOT NULL

--	 ) ON [PRIMARY]
--GO

-- 2.1) Load dbo.t_acct_fact.sql

TRUNCATE TABLE dbo.t_acct_fact;

INSERT INTO dbo.t_acct_fact
SELECT DISTINCT 
       acct_id
     , as_of_date
     , cur_bal
  FROM dbo.stg_p1 AS stg
 ORDER BY acct_id;


-- 3) Create and Load the t_add_dim table


TRUNCATE TABLE dbo.t_add_dim;

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

	
) ON [PRIMARY]
GO

 
-- 4) Create the t_area_dim table

--CREATE TABLE [dbo].[t_area_dim](
--	 [area_id] [int] NOT NULL

	
--) ON [PRIMARY]
--GO
  
  
  -- 4.1) Load the t_area_dim table
  
TRUNCATE TABLE dbo.t_area_dim;

INSERT INTO dbo.t_area_dim
SELECT DISTINCT 
       acct_area_id
  FROM dbo.stg_p1 AS stg
 ORDER BY acct_area_id;

 
-- 5) Create the t_branch_dim table

--CREATE TABLE dbo.t_branch_dim
--(branch_id   SMALLINT NOT NULL
--, branch_name VARCHAR(100) NOT NULL
--, add_id      INT NOT NULL
--, region_id   INT NOT NULL
--)
--ON [PRIMARY];
--GO
  
  
  -- 5.1) Load the t_branch_dim table
  
TRUNCATE TABLE dbo.t_branch_dim;

INSERT INTO dbo.t_branch_dim
SELECT DISTINCT 
       branch_id
     , acct_branch_desc
     , acct_branch_add_id
     , acct_region_id
  FROM dbo.stg_p1 AS stg
 ORDER BY branch_id;

 -- 6) Create the t_acct_dim_role table

CREATE TABLE dbo.t_cust_acct_role_dim
(acct_cust_role_id INT NOT NULL
)
ON [PRIMARY];
GO
  
  
  -- 6.1) Load the dbo.t_cust_acct_role_dim table
  
TRUNCATE TABLE dbo.t_cust_acct_role_dim;

INSERT INTO dbo.t_cust_acct_role_dim
SELECT DISTINCT 
       acct_cust_role_id
  FROM dbo.stg_p1 AS stg
 ORDER BY acct_cust_role_id;

  -- 7) Create the dbo.t_cust_dim table

--CREATE TABLE dbo.t_cust_dim
--(cust_id         SMALLINT NOT NULL
--, last_name       VARCHAR(100) NOT NULL
--, first_name      VARCHAR(100) NOT NULL
--, gender          VARCHAR(1) NOT NULL
--, birth_date      [DATE] NOT NULL
--, cust_since_date [DATE] NOT NULL
--, pri_branch_id   SMALLINT NOT NULL
--, cust_rel_id     SMALLINT NOT NULL
--, cust_add_id     INT NOT NULL,
--)
--ON [PRIMARY];
--GO
  
  
  -- 7.1) Load the dbo.t_cust_dim table
  
TRUNCATE TABLE dbo.dbo.t_cust_dim;

INSERT INTO dbo.t_cust_dim
SELECT DISTINCT 
       cust_id
     , last_name
     , first_name
     , gender
     , birth_date
     , cust_since_date
     , pri_branch_id
     , cust_rel_id
     , cust_add_id
  FROM dbo.stg_p1 AS stg
 ORDER BY cust_id;

  -- 8) Create the dbo.t_cust_acct_dim table

--CREATE TABLE [dbo].[t_cust_acct_dim](
--	[acct_cust_id] [int] IDENTITY(1,1) NOT NULL,
--	[acct_id] [int] NOT NULL,
--	[cust_id] [smallint] NOT NULL,
--	[acct_cust_role_id] [smallint] NOT NULL,
-- CONSTRAINT [PK_t_cust_acct_dim] PRIMARY KEY CLUSTERED 
--(
--	[acct_cust_id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO  
  
  -- 8.1) Load the t_cust_acct_dim table
  
TRUNCATE TABLE t_cust_acct_dim;

INSERT INTO dbo.t_cust_acct_dim
SELECT DISTINCT 
       acct_id
     , cust_id
     , acct_cust_role_id
  FROM dbo.stg_p1 AS stg
 ORDER BY acct_id;

 
  -- 9) Create the dbo.t_cust_branch_dim table

--CREATE TABLE [dbo].[t_cust_branch_dim](
--	  [cust_id] [smallint] NOT NULL
--	  ,[acct_id] [int] NOT NULL
--      ,[pri_branch_id] [smallint] NOT NULL
--      ,[cust_pri_branch_dist] [decimal](7, 2) NOT NULL
--	  CONSTRAINT PK_Person PRIMARY KEY (cust_id,acct_id)

	
--) ON [PRIMARY]
--GO
  
  
  -- 9.1) Load the dbo.t_cust_branch_dim table
  
TRUNCATE TABLE dbo.t_cust_branch_dim;

INSERT INTO dbo.t_cust_branch_dim
SELECT DISTINCT 
       cust_id
     , acct_id
     , pri_branch_id
     , cust_pri_branch_dist
  FROM dbo.stg_p1 AS stg
 ORDER BY cust_id;

   -- 10) Create the t_prod_dim table

CREATE TABLE [dbo].[t_prod_dim](
	[prod_id] [smallint] NOT NULL
		
) ON [PRIMARY]
GO
  
  
  -- 10.1) Load the t_prod_dim table
  
TRUNCATE TABLE dbo.t_prod_dim;

INSERT INTO dbo.t_prod_dim
SELECT DISTINCT 
       prod_id
  FROM dbo.stg_p1 AS stg
 ORDER BY prod_id;

    -- 11) Create the t_region_dim table

--CREATE TABLE [dbo].[t_region_dim](
--	 [acct_region_id] [int] NOT NULL,
--	 [acct_area_id] [int] NOT NULL

	
--) ON [PRIMARY]
--GO
  
  
  -- 11.1) Load the t_region_dim table
  
TRUNCATE TABLE dbo.t_region_dim;

INSERT INTO dbo.t_region_dim
SELECT DISTINCT 
       acct_region_id
     , acct_area_id AS L
  FROM dbo.stg_p1 AS stg
 ORDER BY acct_region_id;