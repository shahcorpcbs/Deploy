-- // add employeeId
-- Migration SQL that makes the change goes here.
alter table TwilioSendSmsApiCall add EmployeeId int not null default 0;
GO


-- //@UNDO
-- SQL to undo the change goes here.

