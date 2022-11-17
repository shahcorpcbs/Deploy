-- // add show print modifiers
-- Migration SQL that makes the change goes here.
alter table MiscSetup add showPrintModifiers bit not null default 0;
GO


-- //@UNDO
-- SQL to undo the change goes here.


