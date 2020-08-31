-- Select * from fires_2013_2017

-- Drop table fires_2013_2017;

Create table fires_2013_2017
(
date date
, st varchar(200)
,fire_name varchar(200)
,latitude decimal (8, 4)
,longitude decimal (8, 4)
,fire_cause varchar(500)
)

-- Select * From fires_2013_2017

select fire_cause
,ltrim(rtrim(left(fire_cause, position('/' IN fire_cause)-1)))
from fires_2013_2017;