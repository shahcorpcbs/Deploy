-- // add pieces due report
-- Migration SQL that makes the change goes here.
--alter table EmployeeReportQuery drop column OnlyOpenDays
--GO

alter table EmployeeReportQuery add RunWhen smallint not null default 0
GO

update EmployeeReportQuery set RunWhen = 1 where id = 1
GO

SET IDENTITY_INSERT [EmployeeReportQuery] ON

insert into [dbo].[EmployeeReportQuery](Id, Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day)
values (6, 'Incoming Sales (monthly)', 'Sales by Department',
        1, 3, 19, 0, 0);
GO

insert into [dbo].[EmployeeReportQuery](Id, Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day)
values (7, 'Sales by Payment (monthly)', 'Sales by Payment',
        1, 3, 19, 0, 0);
GO

insert into [dbo].[EmployeeReportQuery](Id, Name, QueryDesc, Active, Frequency, Hour, DayOfWeek, Day, RunWhen)
values (8, 'Pieces Due Tomorrow', 'Pieces per Department Due Date Tomorrow',
        1, 2, 20, 0, 0, 2);

SET IDENTITY_INSERT [EmployeeReportQuery] OFF
GO

-- //@UNDO
-- SQL to undo the change goes here.
delete EmployeeReportQuery where id = 6
GO