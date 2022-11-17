-- // add new cell notification
-- Migration SQL that makes the change goes here.
update SmsMessage set Message = N'You''ve opted in to text notifications from {storename}. Reply QUIT to opt out. Reply JOIN to receive special offers.',
                      Description = 'Opt In Notification' where id = 1

SET IDENTITY_INSERT QueryAlert ON
Insert into QueryAlert(Id, Query, Name, SMSMessageId, MessageTypeId, TriggerType, Frequency, GroupType) values
    (-10, '', 'Cell Phone Changed', 1, 3, 3, 1, 1)
SET IDENTITY_INSERT QueryAlert OFF
GO

insert into CustomerMessageSetup(CustomerId, QueryId, Sms, Email) values
    (0, -10, 1, 0)
GO

update QueryAlert set MessageTypeId = 3 where id in (-8, -9, -10)
GO

update QueryAlert set TriggerType = 0 where id = -8
GO

update Customer set cellPhone = '' where customerSequenceNumber not in (select customerId from TwilioSendSmsApiCall where customerId is not null)
GO

update QueryAlert set Frequency = 4 where id = -2
GO
-- //@UNDO
-- SQL to undo the change goes here.


