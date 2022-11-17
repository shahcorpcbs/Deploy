-- // move firsts to notifications
-- Migration SQL that makes the change goes here.
SET IDENTITY_INSERT QueryAlert ON
Insert into QueryAlert(Id, Name, Query, SmsMessageId, TriggerType, Frequency, messageTypeId, Hour, DayOfWeek, Day)
    (select -6, Name, Query, SmsMessageId, 1, Frequency, 2, Hour, DayOfWeek, Day from QueryAlert where Name = 'First Drop Off')

Insert into QueryAlert(Id, Name, Query, SmsMessageId, TriggerType, Frequency, messageTypeId, Hour, DayOfWeek, Day)
    (select -7, Name, Query, SmsMessageId, 1, Frequency, 2, Hour, DayOfWeek, Day from QueryAlert where Name = 'First Pick up')

delete QueryAlert where name in ('First Drop Off', 'First Pick up') and id > 0

SET IDENTITY_INSERT QueryAlert OFF

update QueryAlert set Name = 'Pickup after every x times',
    Query = 'select c.customerSequenceNumber from customer c inner join ticket t on c.customersequencenumber = t.customersequencenumber where c.routeNumber = 0 and ticketStatus = ''FI'' group by c.customerSequenceNumber having count(t.ticketnumber) % {times} = 0'
    where Name = 'Pickup after x times';
GO


-- //@UNDO
-- SQL to undo the change goes here.


