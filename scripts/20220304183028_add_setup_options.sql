-- // add setup options
-- Migration SQL that makes the change goes here.
alter table MiscSetup add promptAfterCCUpdate bit not null DEFAULT 0
GO


-- //@UNDO
-- SQL to undo the change goes here.


