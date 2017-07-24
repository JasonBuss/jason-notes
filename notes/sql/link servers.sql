--SQL Script to link servers:

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