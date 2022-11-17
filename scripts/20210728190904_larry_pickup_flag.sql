-- // larry pickup flag
-- Migration SQL that makes the change goes here.
alter table MiscSetup add useRstHeatSeal bit not null default 0
GO


-- //@UNDO
-- SQL to undo the change goes here.


