-- // route closure
-- Migration SQL that makes the change goes here.
INSERT INTO [dbo].[SmsMessage] (Message, Description, Subject)
VALUES ('{storename}: Due to day off, the route that normally stops at your location will not run tomorrow',
        'Route Day Off', '{storename}: No Stop Tomorrow');
GO


SET IDENTITY_INSERT [QueryAlert] ON
insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day, groupType)
    (select -13, 'Route Day Off',
            'select customerSequenceNumber from customer where twilioBlackList = 0 and RouteNumber != 0 and cellPhone is not null and cellPhone != ''''',
            id, 2, 2, 2, 10, 0, 1, 3 from SmsMessage where Description = 'Route Day Off');
SET IDENTITY_INSERT [QueryAlert] OFF

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select customerId, -13, sms, email from CustomerMessageSetup where QueryId = -5 and (sms = 1 or email = 1))
GO


-- //@UNDO
-- SQL to undo the change goes here.
delete CustomerMessageSetup where QueryId = -13
GO
delete QueryAlert where id = -13
GO
delete SmsMessage where Description = 'Route Day Off'
GO

