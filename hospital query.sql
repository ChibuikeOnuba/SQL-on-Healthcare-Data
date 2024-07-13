select *
from public.encounters
where encounterclass in ('outpatient', 'ambulatory')


select description, 
	count(*) as count_of_cond
	from public.conditions
	where description != 'Body Mass Index 30.0-30.9, adult'
group by description
	having count(*) > 5000
order by count_of_cond desc

	
/*---------------------------------------------------------------------
---EXERCISE 2
-- display all patients who have been diagnosed
with Chronic Kidney Disease (Use condition codes-585.1 to 581.4)
*/---------------------------------------------------------------------
	
select patient 
	from conditions
where code in ('585.1','585.2','585.3','585.4')



	
--- EXERCISE 3--------------------------------------------------------
-- Write a query that does the following:
-- 1. Lists out number of patients per city in desc order
-- 2. Does not include boston
-- 3. Must have at least 100 patients from that city
----------------------------------------------------------------------

/* This query displays the number of patients in each city of residence
having at least 100 patients and does not include Boston
*/
	
select city, count(*) as num_of_pat
	from patients
	where city != 'Boston'
group by city
having count(*) >= 100
order by num_of_pat desc