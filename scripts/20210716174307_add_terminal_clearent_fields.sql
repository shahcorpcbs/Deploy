-- // add terminal clearent fields
-- Migration SQL that makes the change goes here.
alter table Terminal add API_Key nvarchar(50) NULL;
GO
-- //@UNDO
-- SQL to undo the change goes here.


