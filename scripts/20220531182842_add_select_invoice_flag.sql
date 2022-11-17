-- // add select invoice flag
-- Migration SQL that makes the change goes here.
alter table MiscSetup add selectInvScanned bit not null DEFAULT 1
GO


-- //@UNDO
-- SQL to undo the change goes here.


