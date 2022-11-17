-- // add sms store name variable
-- Migration SQL that makes the change goes here.
alter table MiscSetup add smsStoreName varchar(255)
GO

update MiscSetup set smsStoreName = (select name from Store s where s.storeId = MiscSetup.storeID)
GO

-- //@UNDO
-- SQL to undo the change goes here.


