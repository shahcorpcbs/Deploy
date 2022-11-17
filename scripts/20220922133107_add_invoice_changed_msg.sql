-- // add invoice changed msg
-- Migration SQL that makes the change goes here.
INSERT INTO [dbo].[SmsMessage] (Message, Description, Subject)
VALUES ('Your order {invoice} has been updated. New price is {amount}. Reason: {employeeNote}', 'Invoice Updated Message', 'Invoice Updated');
GO


SET IDENTITY_INSERT [QueryAlert] ON
insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, GroupType)
    (select -17, 'Invoice Updated', '', id, 0, 1, 3, 1 from SmsMessage where Description = 'Invoice Updated Message');
SET IDENTITY_INSERT [QueryAlert] OFF
GO



-- //@UNDO
-- SQL to undo the change goes here.
delete SmsMessage where Description = 'Invoice Updated Message'
GO
delete QueryAlert where id = -17
GO

