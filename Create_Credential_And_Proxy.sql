USE [master]
GO
CREATE CREDENTIAL [SQLMon_Credential] WITH IDENTITY = N'DOMAIN\USER', SECRET = N'ukukuk12345'
GO
USE [msdb]
GO

EXEC msdb.dbo.sp_add_proxy @proxy_name=N'SQLMon_PSproxy',@credential_name=N'SQLMon_Credential', 
@enabled=1
GO

EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'SQLMon_PSproxy', @subsystem_id=12
GO


