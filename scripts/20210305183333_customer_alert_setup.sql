-- // customer alert setup
-- Migration SQL that makes the change goes here.
USE [shahcorp];
alter table QueryAlert add MessageTypeId smallint not null default 1;
GO

delete QueryAlert where Name = 'Racked for a Month';
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
CREATE TABLE [dbo].[CustomerMessageSetup]
(
    [Id]           [bigint]      NOT NULL IDENTITY (1,1) PRIMARY KEY,
    [CustomerId] [bigint] NOT NULL,
    [QueryId] [bigint] NULL,
    [Sms] [bit] NOT NULL default 0,
    [Email] [bit] NOT NULL default 0

)
GO

INSERT INTO [dbo].[SmsMessage] (Message, Description)
VALUES ('Order(s) {invoices} were delivered by {storename}', 'Order Delivered Message');
INSERT INTO [dbo].[SmsMessage] (Message, Description)
VALUES ('Thank you for your order at {storename}. Please let us know if we can be of any assistance. We look forward to seeing you soon', 'Drop Off Message');
INSERT INTO [dbo].[SmsMessage] (Message, Description)
VALUES ('Thank you for your business at {storename}. We hope you enjoy your clean garments. Please call or text us if there is anything we can do. We look forward to seeing you soon', 'Pick up Message');
INSERT INTO [dbo].[SmsMessage] (Message, Description)
VALUES ('A friendly reminder, your Order Number(s) {invoices} are ready at {storename}. For curbside pickup text ARRIVED when you have parked', 'Orders Overdue Message');
GO

alter table QueryAlert add Hour smallint;
alter table QueryAlert add DayOfWeek smallint;
alter table QueryAlert add Day smallint;
GO

SET IDENTITY_INSERT [QueryAlert] ON
insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day)
 (select -1, 'Order Delivered', '', id, 1, 4, 2, 10, 0, 1 from SmsMessage where Description = 'Invoices Delivered Message');

insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day)
 (select -2, 'Order Racked', '', id, 1, 4, 2, 10, 0, 1  from SmsMessage where Description = 'Order Ready Alert Message (non-delivery)');

insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day)
 (select -3, 'Orders Overdue 14 Days', '', id, 1, 2, 2, 10, 0, 1  from SmsMessage where Description = 'Orders Overdue Message');

insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day)
 (select -4, 'Orders Overdue 30 Days', '', id, 1, 2, 2, 10, 0, 1  from SmsMessage where Description = 'Orders Overdue Message');

insert into [dbo].[QueryAlert](Id, Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day) values
    (-5, 'Stop/Delivery Message', '', 4, 2, 2, 2, 10, 1, 1);
GO

SET IDENTITY_INSERT [QueryAlert] OFF

insert into [dbo].[QueryAlert](Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day)
 (select 'First Drop Off', 'select distinct c.customerSequenceNumber from customer c inner join ticket t on c.customersequencenumber = t.customersequencenumber where c.customerSequenceNumber not in (select customerSequenceNumber from Ticket where datediff(hour, createdDate, getdate()) >= 1) and c.routeNumber = 0',
         id, 1, 4, 1, 10, 1, 1  from SmsMessage where Description = 'Drop Off Message');

insert into [dbo].[QueryAlert](Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day)
    (select 'First Pick up', 'select distinct c.customerSequenceNumber from customer c inner join ticket t on c.customersequencenumber = t.customersequencenumber where c.customerSequenceNumber not in (select customerSequenceNumber from Ticket where datediff(day, statusChangeDate, getdate()) >= 1 and ticketStatus = ''FI'') and c.routeNumber = 0 and ticketStatus = ''FI''',
            id, 1, 2, 1, 10, 1, 1  from SmsMessage where Description = 'Pick up Message');

insert into [dbo].[QueryAlert](Name, Query, SmsMessageId, TriggerType, Frequency, MessageTypeId, Hour, DayOfWeek, Day)
 (select 'Pickup after every x times', 'select c.customerSequenceNumber from customer c inner join ticket t on c.customersequencenumber = t.customersequencenumber where c.routeNumber = 0 and ticketStatus = ''FI'' group by c.customerSequenceNumber having count(t.ticketnumber) % {times} = 0', id,
               1, 2, 1, 10, 1, 1  from SmsMessage where Description = 'Pick up Message');
GO


insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email) (select customerSequenceNumber, -5, 1, 0 from Customer where sendTextAlert = 1 and cellPhone is not null)
GO


insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email) values (0, -1, 0, 0)
GO
insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email) values (0, -2, 0, 0)
GO
insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email) values (0, -3, 0, 0)
GO
insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email) values (0, -4, 0, 0)
GO
insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email) values (0, -5, 0, 0)
GO

update QueryAlert set Hour = 0, DayOfWeek = 0, Day = 1 where Hour is null
GO

-- //@UNDO
-- SQL to undo the change goes here.
