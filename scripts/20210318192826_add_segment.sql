-- // add segment
-- Migration SQL that makes the change goes here.
USE [shahcorp];
alter table TwilioResponseMessage add segments int;
GO
update TwilioResponseMessage set segments = (LEN(body) / 160) + 1
GO
ALTER TABLE TwilioResponseMessage ALTER COLUMN body VARCHAR (1012)
GO

-- //@UNDO
-- SQL to undo the change goes here.


