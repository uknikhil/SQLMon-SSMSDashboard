USE [SQLMon-SSMSDashboard]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLMon_Servers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [nvarchar](50) NULL
) ON [PRIMARY]
GO

USE [SQLMon-SSMSDashboard]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLMon_ServerMon](
	[MonTime] [datetime] NOT NULL,
	[ServerName] [nvarchar](50) NULL,
	[Status] [nvarchar](5) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SQLMon_ServerMon] ADD  CONSTRAINT [SQLMon_MonTime_Con]  DEFAULT (getdate()) FOR [MonTime]
GO


