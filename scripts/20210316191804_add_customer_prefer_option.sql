-- // add customer prefer option
-- Migration SQL that makes the change goes here.
USE [shahcorp];
alter table Customer add contactPref smallInt not null default 2;
GO


-- //@UNDO
-- SQL to undo the change goes here.


