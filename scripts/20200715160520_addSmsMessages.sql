USE [shahcorp];
SET IDENTITY_INSERT [SmsMessage] ON
delete SmsMessage where id < 11
GO

SET IDENTITY_INSERT [SmsMessage] ON
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description) VALUES (1, '', 'Reserved');
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description)
VALUES (2, ' To unsubscribe from future messages, reply with the word "quit" in your message. ', 'Default End of Text Messages.');

INSERT INTO [dbo].[SmsMessage] (Id, Message, Description)
VALUES (3, 'Your garments are ready to be picked up at {storename}. ', 'Order Ready Alert Message (non-delivery)');

INSERT INTO [dbo].[SmsMessage] (Id, Message, Description) VALUES (4, '', 'Reserved');
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description) VALUES (5, '', 'Reserved');
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description) VALUES (6, '', 'Reserved');
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description) VALUES (7, '', 'Reserved');
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description) VALUES (8, '', 'Reserved');
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description) VALUES (9, '', 'Reserved');
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description) VALUES (10, '', 'Reserved');
SET IDENTITY_INSERT [SmsMessage] OFF
GO

insert into [dbo].[QueryAlert](Name, Query, SmsMessageId, TriggerType, Frequency)
values ('Welcome Message',
        'select customerSequenceNumber from customer where isactive = 1 and cellPhone is not null and sendTextAlert = 1 and (customerSequenceNumber not in (select customerId from TwilioSendSmsApiCall) or cellPhone not in (select phoneNumber from TwilioSendSmsApiCall))',
        1, 1, 2)
GO