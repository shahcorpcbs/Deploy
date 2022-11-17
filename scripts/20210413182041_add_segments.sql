-- // add segments
-- Migration SQL that makes the change goes here.
alter table TwilioSendSmsApiCall add segments int;
GO
update TwilioSendSmsApiCall set segments = (DATALENGTH(Message) / 160) + 1
GO

-- //@UNDO
-- SQL to undo the change goes here.


