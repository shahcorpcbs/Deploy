-- // add route alert flag
-- Migration SQL that makes the change goes here.
USE [shahcorp];

alter table Route add SendAlerts bit default 1 not null;
GO

-- //@UNDO
-- SQL to undo the change goes here.

