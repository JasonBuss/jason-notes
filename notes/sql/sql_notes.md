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

[home](/jason-notes)<br>
[customerfx](http://www.customerfx.com)<br>