-- // add card exp noti
-- Migration SQL that makes the change goes here.


INSERT INTO [dbo].[SmsMessage] (Message, Description, Subject)
VALUES ('{storename}: Your saved credit card is scheduled to expire in {expMonth}, please contact us to update your card information',
        'Card Expiring Message', '{storename}: Your saved credit card is close to expiring');
GO


SET IDENTITY_INSERT [QueryAlert] ON
insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day, GroupType)
    (select -11, 'Card Expiring', '', id, 2, 3, 2, 10, 0, 1, 2 from SmsMessage where Description = 'Card Expiring Message');
SET IDENTITY_INSERT [QueryAlert] OFF

insert into QueryAlertVariable (QueryId, VariableDesc, VariableField, VariableValue)
    (select id, 'Months ahead', 'months', 2 from QueryAlert where Name = 'Card Expiring');
GO

insert into QueryAlertVariable (QueryId, VariableDesc, VariableField, VariableValue)
    (select id, 'Order within x days', 'days', 90 from QueryAlert where Name = 'Card Expiring');
GO

-- //@UNDO
-- SQL to undo the change goes here.
delete SmsMessage where Description = 'Card Expiring Message'
delete QueryAlertVariable where QueryId = -11
GO
delete QueryAlert where id = -11
GO
