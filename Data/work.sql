-- Select * from fires_2013_2017

-- Drop table fires_2013_2017;

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
)

alter table fires_2013_2017 add year varchar(20);
select date
from fires_2013_2017
group by date
order by date;

select *
from fires_2013_2017

alter table fires_2013_2017 add constraint primary_key primary key(cause4);