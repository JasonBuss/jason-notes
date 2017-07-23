set nocount on;

--Script to delete all but most recent Salesprocesses record by EntityID

--create table variable to hold values
declare @tmpRecs table
(
	SALESPROCESSESID CHAR(12)
,	ENTITYID CHAR(12)
,	MODIFYDATE DATETIME
);
declare @delrecs table
(
	salesprocessesid char(12)
);

--cte to get counts by entityid
with RecCnts as (
	select entityid, count(entityid)as cnt from SALESPROCESSES group by entityid
)
INSERT INTO @tmpRecs
select a.SALESPROCESSESID, a.ENTITYID, a.MODIFYDATE from SALESPROCESSES a inner join RecCnts b on a.ENTITYID = b.entityid
where b.cnt > 1 order by entityid, MODIFYDATE desc;

--cte to isolate records to delete
with toprec as (
	select *, row_number()
	over (
		partition by entityid
		order by modifydate
		)
as RowNo
from @tmpRecs
)
insert into @delrecs
select SALESPROCESSESID from toprec where RowNo > 1;

set nocount off;

--Enable this line to get list of records to be deleted
--select * from SALESPROCESSES where SALESPROCESSESID in (select SALESPROCESSESID from @delrecs)

--Enable this line to delete records from Salesprocesses table
delete from SALESPROCESSES where SALESPROCESSESID in (select SALESPROCESSESID from @delrecs)
