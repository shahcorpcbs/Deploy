-- // add printer sms prompt
-- Migration SQL that makes the change goes here.
alter table printer add promptAfterSms bit not null default 1
GO

-- //@UNDO
-- SQL to undo the change goes here.


