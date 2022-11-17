-- // add cash drawer alert
-- Migration SQL that makes the change goes here.
insert into EmployeeMessageSetup (EmployeeId, MessageId, Sms, Email)
    (select distinct EmployeeId, 7, 0, 0 from EmployeeMessageSetup)
GO

-- //@UNDO
-- SQL to undo the change goes here.


