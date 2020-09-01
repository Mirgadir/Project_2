-- Select * from fires_2013_2017

-- Drop table if exists fires_2013_2017;

Create table fires_2013_2017
(
ID Integer Primary Key Not NULL
,date varchar(100)
, st varchar(200)
,fire_name varchar(200)
,latitude decimal (8, 4)
,longitude decimal (8, 4)
,fire_cause varchar(500)
,cause1 varchar(100)
,cause2 varchar(100)
,cause3 varchar(100)
,cause4 varchar(100)
,Month INT
,Day INT
,Year INT
)

alter table fires_2013_2017 add year varchar(20);
select date
from fires_2013_2017
group by date
order by date;

select *	--29602
from fires_2013_2017



--
--	Group undetermined/Null values for fire_cause
--
select fire_cause, count(*)
from fires_2013_2017
group by fire_cause
order by fire_cause

Update fires_2013_2017
set fire_cause = 'Undetermined'
where fire_cause IS NULL

--
--	Group undetermined/Null values for cause1
--
select cause1, count(*)
from fires_2013_2017
group by cause1
order by cause1

Update fires_2013_2017
set cause1 = 'Undetermined'
where cause1 IS NULL

--
--	Group undetermined/Null values for cause2
--
select cause2, count(*)
from fires_2013_2017
group by cause2
order by cause2

Update fires_2013_2017
set cause2 = 'Other/Undetermined'
where cause2 IS NULL
or cause2 = 'Other'

--
--	Group undetermined/Null values for cause3
--
select cause3, count(*)
from fires_2013_2017
group by cause3
order by cause3

Update fires_2013_2017
set cause3 = 'Other/Undetermined'
where cause3 IS NULL
or cause3 like '%unknown%'
or cause3 = 'Unknown'
or cause3 = 'Other'

--
--	Group undetermined/Null values for cause4
--
select cause4, count(*)
from fires_2013_2017
group by cause4
order by cause4

Update fires_2013_2017
set cause4 = 'Other/Undetermined'
where cause4 IS NULL
or cause4 like '%unknown%'

Select * FROM fires_2013_2017

Select cause1 
FROM fires_2013_2017
group by cause1
order by cause1

--
-- Remove Spaces in Causes
--
Update fires_2013_2017
 set cause1 = ltrim(rtrim(cause1))
 	,cause2 = ltrim(rtrim(cause2))
	,cause3 = ltrim(rtrim(cause3))
	,cause4 = ltrim(rtrim(cause4))

--
-- Remove Spaces in Causes
--
Update fires_2013_2017
 set cause1 = replace(cause1, '/', '_') 
 	,cause2 = replace(cause2, '/', '_')
	,cause3 = replace(cause3, '/', '_')
	,cause4 = replace(cause4, '/', '_')

--
--	Get distinct values for API Data Dictionary
--
Select cause1
FROM fires_2013_2017
group by cause1
order by cause1

Select cause2
FROM fires_2013_2017
group by cause2
order by cause2

Select cause3
FROM fires_2013_2017
group by cause3
order by cause3

Select cause4
FROM fires_2013_2017
group by cause4
order by cause4

--
--	Get states
--
Select st
FROM fires_2013_2017
group by st
order by st

--
--	Get Min/Max dates
--
Select Max(cast(date as date))
	,MIN(cast(date as date))
FROM fires_2013_2017
