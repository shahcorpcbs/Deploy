SET IDENTITY_INSERT [SmsMessage] ON
INSERT INTO [dbo].[SmsMessage] (Id, Message, Description)
VALUES (20, 'This is a promotion! 20% off all orders! ', '20% Promotion');

INSERT INTO [dbo].[SmsMessage] (Id, Message, Description)
VALUES (21, 'You have an order that has been racked for at least 30 days and is waiting for pickup. ', '30 Day+ Racking Alert Message');

INSERT INTO [dbo].[SmsMessage] (Id, Message, Description)
VALUES (22, 'It''s your birthday month {customername}. Enjoy 10% off any order this month.', 'Birthday Discount');

SET IDENTITY_INSERT [SmsMessage] OFF

insert into [dbo].[QueryAlert](Name, Query, SmsMessageId, TriggerType, Frequency)
values ('Every Customer', 'select customersequenceNumber from Customer where sendTextAlert = 1', 20, 1, 1);

insert into [dbo].[QueryAlert](Name, Query, SmsMessageId, TriggerType, Frequency)
values ('Racked for a Month',
       'select distinct CustomerSequenceNumber from Ticket t, RackAssignment ra where t.ticketNumber = ra.ticketNumber and ra.pickedUp = 0 and rackedDate < dateadd(day,-30, CURRENT_TIMESTAMP)',
       21, 1, 2);

insert into [dbo].[QueryAlert](Name, Query, SmsMessageId, TriggerType, Frequency)
values ('Birthday Month Discount',
        'select customerSequenceNumber from Customer where sendTextAlert = 1 and birthDate like convert(varchar, Month(getDate())) + ''/%''',
        22, 1, 3)
GO