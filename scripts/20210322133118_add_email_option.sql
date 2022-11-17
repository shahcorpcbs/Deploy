-- // add email option
-- Migration SQL that makes the change goes here.
alter table MiscSetup add useEmail bit not null default 0;
GO


-- //@UNDO
-- SQL to undo the change goes here.

