-- // update default qa
-- Migration SQL that makes the change goes here.
update SmsMessage set Message = 'Your order {invoices} is ready to be picked up.' where id = 3
update QueryAlert set Frequency = 2 where id = -2
GO


-- //@UNDO
-- SQL to undo the change goes here.


