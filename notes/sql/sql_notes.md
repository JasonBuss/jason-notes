# SQL Notes

## Adding Row numbers

### Syntax

```
ROW_NUMBER ( )   
    OVER ( [ PARTITION BY value_expression , ... [ n ] ] order_by_clause )
```

### Example
```
SELECT 
  ROW_NUMBER() OVER(ORDER BY name ASC) AS Row#,
  name, recovery_model_desc
FROM sys.databases 
WHERE database_id < 5;
```

## Linked Servers

### Example
```
EXEC master.dbo.sp_addlinkedserver 
                            @server = N'SERVERNAME', 
                            @srvproduct=N'', 
                            @provider=N'SQLNCLI', 
                            @datasrc=N'SERVERNAME', 
                            @catalog=N'master',
                            @provstr='Integrated Security=SSPI;'
GO
EXEC sp_addlinkedsrvlogin 'SERVERNAME', true  
go
```

## Table Variables
```
Declare @TableName Table (
  field1 char(12),
  field2 datetime,
  field3 varchar(32)
)
```

## Create guid as varchar(32)
```
select replace(newid(), '-', '')
```

## Insert Into new Table
```
SELECT *
INTO newtable
FROM oldtable
WHERE condition;
```

## scripts to return enable/disable scripts for all triggers in a DB
```
--script to create disable trigger statments for all active triggers in the current DB
SELECT  
     'DISABLE TRIGGER ' + TRIG.name + ' ON SYSDBA.' + TAB.name + ';'
FROM [sys].[triggers] as TRIG 
inner join sys.tables as TAB 
on TRIG.parent_id = TAB.object_id 
where trig.is_disabled = 0
order by TAB.name, TRIG.name

--script to create enable trigger statments for all inactive triggers in the current DB
SELECT  
     'ENABLE TRIGGER ' + TRIG.name + ' ON SYSDBA.' + TAB.name + ';'
FROM [sys].[triggers] as TRIG 
inner join sys.tables as TAB 
on TRIG.parent_id = TAB.object_id 
where trig.is_disabled = 1
order by TAB.name, TRIG.name
```
[home](/jason-notes)<br>