-- // update twilio response table
-- Migration SQL that makes the change goes here.
USE [shahcorp];
alter table twilioResponseMessage add CustomerSequenceNumber int;
GO


-- //@UNDO
-- SQL to undo the change goes here.


