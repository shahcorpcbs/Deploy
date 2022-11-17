-- // employee report no data option
-- Migration SQL that makes the change goes here.
alter table EmployeeReportQuery add sendWhenEmpty bit not null default 0
GO

update EmployeeReportQuery set sendWhenEmpty = 1 where id = 8
GO
-- //@UNDO
-- SQL to undo the change goes here.


