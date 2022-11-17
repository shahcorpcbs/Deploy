-- // add employee report table
-- Migration SQL that makes the change goes here.
USE [shahcorp];
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[EmployeeReportQuery](
[Id] [bigint] NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] VARCHAR(100)  NOT NULL,
[QueryDesc] VARCHAR(200)  NULL,
[Active] [bit] NOT NULL,
[Frequency] [smallint] NOT NULL,
[Hour] [smallint],
[DayOfWeek] [smallint],
[Day] [smallint]
);
GO

insert into [dbo].[EmployeeReportQuery](Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day)
values ('Invoices Not Racked', 'Invoices not racked and total pieces',
        1, 2, 15, 0, 0);
GO

insert into [dbo].[EmployeeReportQuery](Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day)
values ('Incoming Sales (daily)', 'Sales by Department',
        1, 2, 19, 0, 0);
GO

insert into [dbo].[EmployeeReportQuery](Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day)
values ('Incoming Sales (weekly)', 'Sales by Department',
        1, 5, 19, 7, 0);
GO

insert into [dbo].[EmployeeReportQuery](Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day)
values ('Sales by Payment (daily)', 'Sales by Payment',
        1, 2, 19, 0, 0);
GO

insert into [dbo].[EmployeeReportQuery](Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day)
values ('Sales by Payment (weekly)', 'Sales by Payment',
        1, 5, 19, 7, 0);
GO

-- //@UNDO
-- SQL to undo the change goes here.

