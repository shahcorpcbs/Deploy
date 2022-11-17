-- // add print tags after edit
-- Migration SQL that makes the change goes here.
alter table MiscSetup add promptTagsEdit bit not null default 1
GO

-- //@UNDO
-- SQL to undo the change goes here.
