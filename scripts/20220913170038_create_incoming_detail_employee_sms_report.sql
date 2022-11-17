-- // create incoming detail employee sms report
-- Migration SQL that makes the change goes here.
SET IDENTITY_INSERT [dbo].[EmployeeReportQuery] ON;
insert into [dbo].[EmployeeReportQuery](ID, Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day)
values (9, 'Incoming Detail By Creation (daily)', 'Incoming Detail', 0, 2, 11, 0, 0);
SET IDENTITY_INSERT [dbo].[EmployeeReportQuery] OFF;
GO

alter table QueryAlertVariable add employeeQueryId int;
GO


insert into QueryAlertVariable (EmployeeQueryId, VariableDesc, VariableField, VariableValue) values
    (9, 'Hour Cutoff Time', 'hour', 10);
GO


-- //@UNDO
-- SQL to undo the change goes here.


