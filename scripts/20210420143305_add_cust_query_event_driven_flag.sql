-- // add cust query event driven flag
-- Migration SQL that makes the change goes here.

alter table MiscSetup add InvoiceReceiptDelay int not null default 5
GO

update SmsMessage set Message = '{storename} Credit Card Receipt', Description = 'Credit Card Receipt', Subject = 'Your {storename} Credit Card Receipt'
where id = 7

update SmsMessage set Description = 'Order Created', Subject = 'Your {storename} Order',
Message = '{storename} Order Created' + CHAR(13)+CHAR(10) + '{departments}' + CHAR(13)+CHAR(10) +'Total Pcs: {pieces}'
            + CHAR(13)+CHAR(10) + '{totalIfAvailable}'
            + CHAR(13)+CHAR(10) +'Due Date: {dueDate}' + CHAR(13)+CHAR(10) + 'Pickup Time: {defaultPickupTime}'
where id = 8
GO

SET IDENTITY_INSERT QueryAlert ON
Insert into QueryAlert(Id, Query, Name, SMSMessageId, MessageTypeId, TriggerType, Frequency) values
    (-8, '', 'Credit Card Receipt Header', 7, 2, 3, 1)

Insert into QueryAlert(Id, Query, Name, SMSMessageId, MessageTypeId, TriggerType, Frequency) values
    (-9, '', 'Order Creation', 8, 2, 3, 1)

SET IDENTITY_INSERT QueryAlert OFF
GO

-- //@UNDO
-- SQL to undo the change goes here.
delete SmsMessage where id in (7, 8)
GO
delete QueryAlert where id in (-8, -9)
GO



