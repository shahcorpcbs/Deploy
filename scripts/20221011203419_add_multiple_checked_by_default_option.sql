-- // add multiple checked by default option
-- Migration SQL that makes the change goes here.
alter table MiscSetup add multipleDescAutoChecked bit not null DEFAULT 0
GO


-- //@UNDO
-- SQL to undo the change goes here.


