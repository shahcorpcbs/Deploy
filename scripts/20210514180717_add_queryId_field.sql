-- // add queryId field
-- Migration SQL that makes the change goes here.
alter table TwilioSendSmsApiCall add qaId int
GO
alter table EmailHistory add qaId int
GO

-- //@UNDO
-- SQL to undo the change goes here.


