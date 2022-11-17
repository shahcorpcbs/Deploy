-- // add note field
-- Migration SQL that makes the change goes here.
alter table SMSMessageHistory add Note varchar(1024)
GO


-- //@UNDO
-- SQL to undo the change goes here.


