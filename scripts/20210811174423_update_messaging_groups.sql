-- // update messaging groups
-- Migration SQL that makes the change goes here.
insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
 (select distinct customerId, -1, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
    and customerId not in (select customerId from CustomerMessageSetup where QueryId = -1))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -2, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
    and customerId not in (select customerId from CustomerMessageSetup where QueryId = -2))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -3, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -3))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -4, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -4))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -5, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -5))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -6, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -6))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -7, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -7))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -8, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -8))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -9, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -9))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -10, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -10))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -11, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -11))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -12, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -12))

insert into CustomerMessageSetup (CustomerId, QueryId, Sms, Email)
    (select distinct customerId, -13, 0, 0 from CustomerMessageSetup where customerId in (select customerId from CustomerMessageSetup)
                                                                      and customerId not in (select customerId from CustomerMessageSetup where QueryId = -13))
GO

delete CustomerMessageSetup where customerId != 0 and customerId not in
(select distinct a.customerId from CustomerMessageSetup a, CustomerMessageSetup b where a.customerId != 0 and b.CustomerId = 0 and a.queryId = b.queryId and (a.sms != b.sms or a.Email != b.email))
GO


-- //@UNDO
-- SQL to undo the change goes here.


