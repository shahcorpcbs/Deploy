-- // add terminal printer options
-- Migration SQL that makes the change goes here.
alter table Terminal add useLocalService bit not null DEFAULT 1
GO

alter table Terminal add remotePrintingAddress varchar(20) null;
GO

-- //@UNDO
-- SQL to undo the change goes here.


