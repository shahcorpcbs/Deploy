-- // add store holiday message
-- Migration SQL that makes the change goes here.
INSERT INTO [dbo].[SmsMessage] (Message, Description, Subject)
VALUES ('{storename}: Due to holiday, our store location will not be open tomorrow',
        'Store Day Off', '{storename}: Store Closed Tomorrow');
GO


SET IDENTITY_INSERT [QueryAlert] ON
insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day, groupType)
    (select -14, 'Store Day Off', '',
            id, 2, 2, 2, 10, 0, 1, 2 from SmsMessage where Description = 'Store Day Off');
SET IDENTITY_INSERT [QueryAlert] OFF

insert into QueryAlertVariable (QueryId, VariableDesc, VariableField, VariableValue)
    values (-14, 'Order within x days', 'days', 90);
GO


insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -14, 0, 0 from CustomerMessageSetup)
GO


-- //@UNDO
-- SQL to undo the change goes here.

