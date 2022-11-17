-- // add customer alert options
-- Migration SQL that makes the change goes here.
alter table QueryAlert add RunWhen smallint not null default 0
GO


-- //@UNDO
-- SQL to undo the change goes here.


