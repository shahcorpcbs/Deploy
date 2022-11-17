-- // add pieces unfinished report
-- Migration SQL that makes the change goes here.
INSERT INTO [dbo].[SmsMessage] (Message, Description, Subject)
VALUES ('{storename}: Unfortunately your orders {invoices} were not able to be finished as scheduled today. You will receive another alert once they are finished',
        'Order not Finished', '{storename}: Order Not Finished');
GO


SET IDENTITY_INSERT [QueryAlert] ON
insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day, groupType)
    (select -15, 'Order not Finished', '',
            id, 2, 2, 2, 20, 0, 1, 2 from SmsMessage where Description = 'Order not Finished');
SET IDENTITY_INSERT [QueryAlert] OFF
GO


insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -15, 0, 0 from CustomerMessageSetup)
GO


insert into userquery(name,query,description)
values('Unfinished Invoices','
select c.customerSequenceNumber, c.firstName, c.lastName, concat(''('', c.MainAreaCode, '') '', c.MainPhone) ''Main Phone'', c.cellPhone, invoiceNumber,
case when ts.successful is null then ''Not attempted'' else case when ts.successful = 0 then ''Failed sending'' else ''Sms Sent'' end end as ''Message Sent'' from customer c inner join ticket t on c.customersequencenumber = t.customersequencenumber
left join  TwilioSendSmsApiCall ts on ts.customerId = t.customerSequenceNumber and ts.qaId = -15 and  CONVERT(VARCHAR, ts.requestDate, 112) = CONVERT(VARCHAR, GETDATE(), 112)
where t.routeNumber = 0 and  CONVERT(VARCHAR, duedate, 112) = CONVERT(VARCHAR, GETDATE(), 112) and origRackDate is null
order by c.lastName, c.firstName',  'Shows customers who have orders due today that are unfinished and whether they received notifications')
GO

-- //@UNDO
-- SQL to undo the change goes here.


