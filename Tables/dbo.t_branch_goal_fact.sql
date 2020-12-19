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


CREATE TABLE t_branch_goal_fact
(branch_goal_accumulated_id SMALLINT IDENTITY(1, 1) NOT NULL
, branch_goal_id             SMALLINT NOT NULL
, branch_goal_accumulated    DECIMAL(20, 4) NOT NULL
, percent_of_branch_goal     DECIMAL(3, 2) NOT NULL
, as_of_date                 DATE NOT NULL
)
ON [PRIMARY];
GO