-- // add general alert message
-- Migration SQL that makes the change goes here.


INSERT INTO [dbo].[SmsMessage] (Message, Description, Subject)
VALUES ('{storename}: This is a notice from {storename}.',
        'General Notice', '{storename}: General Notice');
GO


insert into [dbo].[QueryAlert](Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day, groupType)
    (select 'General Notice',
            'select customerSequenceNumber from customer where twilioBlackList = 0 and cellPhone is not null and cellPhone != ''''',
            id, 1, 1, 2, 0, 1, 1, 2 from SmsMessage where Description = 'General Notice');

declare @qaId as int;
select @qaId = id from QueryAlert where Name = 'General Notice';

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, @qaId, 1, 0 from CustomerMessageSetup)
GO


-- //@UNDO
-- SQL to undo the change goes here.


