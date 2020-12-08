
CREATE VIEW [dbo].[v_tran_fee_cust] AS
SELECT c.[cust_id]
	  ,c. [first_name] + ' ' + c.[last_name] AS Customer
	  ,a.acct_id
	  ,c.pri_branch_id
	  ,t.branch_id
	  ,b.branch_name
      ,t.[tran_date]
      ,t.[tran_time]
	  ,d.[tran_type_desc]
      ,t.[tran_amt]
      ,t.[tran_fee_amt]
     
  FROM DFNB2.dbo.t_tran_fact AS t
       INNER JOIN
       dbo.t_branch_dim AS b ON t.branch_id = b.branch_id
	   INNER JOIN
	   dbo.t_cust_dim AS c ON c.pri_branch_id = b.branch_id
	   INNER JOIN
	   [dbo].[t_acct_dim] AS a ON c.cust_id = a.pri_cust_id
	   INNER JOIN 
	   dbo.t_tran_type_dim AS d ON t.tran_type_id = d.tran_type_id;
GO


