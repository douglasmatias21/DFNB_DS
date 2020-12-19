CREATE VIEW dbo.v_branch_loan_amt_year AS
SELECT a.branch_id
     , b.branch_name
     , YEAR(open_date) AS 'year'
     , SUM(loan_amt) AS 'Total Loan Amount'
  FROM dbo.t_acct_dim AS a
       INNER JOIN
       dbo.t_branch_dim AS b ON a.branch_id = b.branch_id
	   WHERE YEAR(open_date) IN (2016, 2017, 2018,2019)
 GROUP BY a.branch_id
        , b.branch_name
		,YEAR(open_date)
	--	ORDER BY branch_id,
	--	YEAR(open_date);