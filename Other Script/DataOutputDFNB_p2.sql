/*****************************************************************************************************************
NAME:    DataOutput
PURPOSE: Data Output process for DFNB Project 2

MODIFICATION LOG:
Ver      Date        Author               Description
-----   ----------   -----------------   -------------------------------------------------------------------------------
1.0     12/17/2020   DOUGLAS MATIAS     1. Data output used for DFNB Project 2 Visualizations.


RUNTIME: 
Approx. 1 min

NOTES:
Data output manipulations DFNB Project 2 Visualizations
 
******************************************************************************************************************/


-- 1) Most Profitable Branch

SELECT v.[Sum of Fees]
     , v.branch_name
  FROM dbo.v_sum_fees AS v
 ORDER BY v.[Sum of Fees] DESC
        , branch_name;



-- 2) Count of transactions

SELECT v.branch_name
     , v.tran_type_desc
     , v.[Count of transactions]
  FROM dbo.v_tran_count_cust AS v
 ORDER BY v.[Count of transactions]
        , v.branch_name
        , v.tran_type_desc;
