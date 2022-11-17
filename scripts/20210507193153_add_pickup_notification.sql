-- // add pickup notification
-- Migration SQL that makes the change goes here.
INSERT INTO [dbo].[SmsMessage] (Message, Description, Subject)
VALUES ('{storename} Order Picked up' + CHAR(13)+CHAR(10) + '{departments}'+ CHAR(13)+CHAR(10) + 'Total Pcs: {pieces}'
            + CHAR(13)+CHAR(10) + 'Total Paid: {totalPaid}' + CHAR(13)+CHAR(10) + 'Picked up: {pickupTime}',
        'Order Pickup Receipt', '{storename}: Orders Picked up');
GO


SET IDENTITY_INSERT [QueryAlert] ON
insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, GroupType)
    (select -12, 'Order Pickup Receipt', '', id, 2, 4, 2, 1 from SmsMessage where Description = 'Order Pickup Receipt');
SET IDENTITY_INSERT [QueryAlert] OFF
GO


update Customer set cellPhone = '' where customerSequenceNumber not in (select customerId from TwilioSendSmsApiCall where customerId is not null)
GO

-- //@UNDO
-- SQL to undo the change goes here.
delete QueryAlert where id = -12
GO
delete SmsMessage where Description = 'Order Pickup Receipt'
GO

