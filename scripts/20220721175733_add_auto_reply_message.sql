-- // add auto reply message
-- Migration SQL that makes the change goes here.
INSERT INTO [dbo].[SmsMessage] (Message, Description, Subject)
VALUES ('Messages sent to this phone number are not monitored, please call {storephone} with any questions.',
        'Auto Response Message', '');
GO


SET IDENTITY_INSERT [QueryAlert] ON
insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, GroupType)
    (select -16, 'Auto Response', '', id, 0, 1, 3, 1 from SmsMessage where Description = 'Auto Response Message');
SET IDENTITY_INSERT [QueryAlert] OFF
GO


-- //@UNDO
-- SQL to undo the change goes here.
delete SmsMessage where Description = 'Auto Response Message'
GO
delete QueryAlert where id = -16
GO

