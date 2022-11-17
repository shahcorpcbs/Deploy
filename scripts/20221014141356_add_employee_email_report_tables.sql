-- // add employee email report tables
-- Migration SQL that makes the change goes here.
USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[EmailReportSchedule](
[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] [varchar](64),
[UserQueryId] [int],
[ReportId] [int],
[Active] [bit] NOT NULL,
[Frequency] [smallint] NOT NULL,
[Hour] [smallint],
[DayOfWeek] [smallint],
[Day] [smallint],
[SendAsAttachment] [bit] NOT NULL,
[Query] [text],
[FormatType] [smallint] NOT NULL default 1
);
GO


CREATE TABLE [dbo].[EmployeeEmailReport](
[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
[ReportScheduleId] [bigint] not null,
[EmployeeId] [int] NOT NULL
);
GO

CREATE TABLE [dbo].[EmailCustomerSchedule](
[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] [varchar](64),
[UserQueryId] [int],
[ReportId] [int],
[Active] [bit] NOT NULL,
[Frequency] [smallint] NOT NULL,
[Hour] [smallint],
[DayOfWeek] [smallint],
[Day] [smallint],
[SendAsAttachment] [bit] NOT NULL,
[Query] [text] NOT NULL,
[EmailField] [varchar](64),
[Subject] [varchar](254),
[Message] [text],
[FormId] [int],
[FormatType] [smallint] NOT NULL default 1
);
GO


CREATE TABLE [dbo].[EmailReportVariable](
[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
[EmpEmailSchId] [int],
[CustEmailSchId] [int],
[VariableName] [varchar](64) NOT NULL,
[VariableValue] [varchar](64) NOT NULL
);
GO


-- //@UNDO
-- SQL to undo the change goes here.
drop table EmailReportVariable
GO

drop table EmployeeEmailReport
GO

drop table EmailReportSchedule
GO

drop table EmailCustomerSchedule
GO
