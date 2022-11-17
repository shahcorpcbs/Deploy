-- // add blacklist cust report
-- Migration SQL that makes the change goes here.
insert into userquery(name,query,description)
values('Opt Out Customers','
SELECT c.customerName, cellPhone,
     (select count(*) from TwilioSendSmsApiCall tss where tss.customerId = c.customerSequenceNumber and successful = 1 ) message_count, qa.name
     from customer c, queryAlert qa, TwilioSendSmsApiCall tss2
     where tss2.customerId = c.customerSequenceNumber and qa.id = tss2.qaid and twilioBlackList = 1 and c.isactive = 1
     and tss2.id = (select max(id) from TwilioSendSmsApiCall tss3 where successful = 1 and tss3.customerId = tss2.customerId and tss3.qaid is not null)',
       'Shows customers who have opted out of text messages')
GO

-- //@UNDO
-- SQL to undo the change goes here.


