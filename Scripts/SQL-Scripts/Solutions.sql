--Question 1----

/* Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. 
Only include the id field in the resulting table. */

Select id from orders where gloss_qty > 4000 or poster_qty > 4000;

--Question 2----
/* Write a query that returns a list of orders where the standard_qty is zero and 
either the gloss_qty or poster_qty is over 1000. */

select id from orders where standard_qty = 0 and (gloss_qty > 1000 or poster_qty > 1000)

--Question 3---
/* Find all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but 
does not contain 'eana'. */

select name from accounts where (name like 'C%' or name like 'W%') and 
         (primary_poc like '%ana%' or primary_poc like '%Ana%')
		 and primary_poc not like '%eana%'

--Question 4--
/* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name.
 Sort the accounts alphabetically (A-Z) by account name. */

 select r.name region_name, s.name "sales rep name", a.name "account name"
 from region r join sales_reps s 
 on r.id = s.region_id
 join accounts  a
 on s.id = a.sales_rep_id
 order by a.name


