-- // add popup flag
-- Migration SQL that makes the change goes here.
alter table Terminal add cellPhonePopup bit not null default 1;
GO


-- //@UNDO
-- SQL to undo the change goes here.


