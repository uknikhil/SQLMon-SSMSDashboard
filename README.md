# What is SQLMon-SSMSDashboard?
SQLMon-SSMSDashboard is a tool to monitor all SQL Server instnces in an environment from SSMS custom report.
It collect SQL Server instance status and store it in a table using powershell. With the help of customized report insnatce status can be 
monitored.

# Steps to setup SQLMons-SSMSDashboard

[1.Create database](Create_Database.sql)

SQL server instace names and data collected from SQL servers has to store in tables. Either you can create a new database or use exisiting database to store all data. If you want to create  new database , you script  [Create_database.sql](https://github.com/uknikhil/SQLMon-SSMSDashboard/blob/master/Create_Database.sql)

After exeecuting sql script to create a databse, make sure database SQLMon-SSMSDashboard has been created.

If you are storing the data in an existing database, going forward make sure you are replacing  SQLMon-SSMSDashboard with exising database name.


[2.Create tables](Create_Tables.sql)

Fowlloing tables will be created in this script.

SQLMon_Servers - Store SQL server instance names. You have to load list of SQL Server instance names in this table.
SQLMon_ServerMon - Store collected data from all servers stored in SQLMon_Servers table.


[3.Create Credential and Proxy account](Create_Credential_And_Proxy.sql)

An account should have access to all the SQL Server instance names stored in table SQLMon_Servers. Data will be collected from all SQL instances with powershell script and same script will schedule to run in Agent job.  This job will run with same privillage of proxy account. 

Create Credential - First you should create a credntial which has access to all SQL Server instances. Credential is created in master table. 

USE [master]
GO
CREATE CREDENTIAL [SQLMon_Credential] WITH IDENTITY = N'DOMAIN\USER', SECRET = N'password'


Create proxy accout - Proxy account is created in MSDB

USE [msdb]
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'SQLMon_PSproxy',@credential_name=N'SQLMon_Credential', 
@enabled=1
GO

EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'SQLMon_PSproxy', @subsystem_id=12
GO


[4. Create SQL Server agent job]()



[5. Create custom report]()

