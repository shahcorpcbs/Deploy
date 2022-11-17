-- // sms_message_updates
-- Migration SQL that makes the change goes here.
USE [shahcorp];
alter table SmsMessage add Subject [varchar](64);
GO

update SmsMessage set Subject = concat(REPLACE(Description, '.', ''), ' from {storename}')  where id != 2 and Description != 'Reserved'
GO

alter table SmsMessage add SmsOnly [varchar](128);
GO

alter table SmsMessage add EmailOnly [varchar](128);
GO


delete SmsMessage where Id in (4, 5)
SET IDENTITY_INSERT [SmsMessage] ON
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description, Subject, SmsOnly, EmailOnly)
VALUES (4, '{storename}: A pickup is scheduled for your location tomorrow. Please have dirty garments ready.',
        'Default Route Stop Notice', '{storename} stop tomorrow', 'To skip this stop reply with "skip" in your message.',
        'To skip this stop, please contact store.');

INSERT INTO [dbo].[SmsMessage] (Id, Message, Description, Subject, SmsOnly, EmailOnly)
VALUES (5, '{storename}: A delivery is scheduled for your address on {date}. Please leave any dirty garments out. ',
        'Default Route Delivery Notice', '{storename} delivery scheduled tomorrow',
        'To skip this stop reply with "skip" in your message.', 'To skip this stop, please contact store.');

SET IDENTITY_INSERT [SmsMessage] OFF
GO

update SmsMessage set message = 'Your stop will be skipped tomorrow.', Description = 'Default Skip Response', Subject='Skip for {storename}' where id = 6
GO

-- //@UNDO
-- SQL to undo the change goes here.
