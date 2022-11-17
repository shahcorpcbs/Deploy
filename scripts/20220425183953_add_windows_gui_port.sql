-- // add windows gui port
-- Migration SQL that makes the change goes here.
alter table MiscSetup add cbsGUIServicePort smallint not null DEFAULT 8412
GO


-- //@UNDO
-- SQL to undo the change goes here.


