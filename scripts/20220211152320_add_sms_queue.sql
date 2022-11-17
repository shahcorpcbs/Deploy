-- // add sms queue
-- Migration SQL that makes the change goes here.
CREATE TABLE [dbo].[SMSSendHistory] (
    [ID] [bigint] IDENTITY(1, 1) NOT NULL,
    [SmsCallId] [bigint] NOT NULL,
    [DateAttempted] [datetime] NOT NULL DEFAULT(getdate()),
    [Successful] bit not null default 0,
    [TwilioErrorCode] int,
    [ErrorMessage] varchar(1046)
)
GO

alter table TwilioSendSmsApiCall add queueStatus smallInt not null default 0
GO
alter table TwilioSendSmsApiCall add HourToQuit smallInt not null default 0
GO
alter table TwilioSendSmsApiCall add LastAttempt datetime not null DEFAULT(getdate())
GO

update TwilioSendSmsApiCall set queueStatus = 1 where successful = 1
GO
update TwilioSendSmsApiCall set queueStatus = -2 where successful = 0 or successful is null
GO
update TwilioSendSmsApiCall set LastAttempt = RequestDate
GO

alter table MiscSetup add maxSMSPerMonth int not null DEFAULT 0
GO

insert into SmsSendHistory(SmsCallId, DateAttempted, Successful, TwilioErrorCode, ErrorMessage)
    (select id, RequestDate, successful, TwilioErrorCode, ErrorMessage from TwilioSendSmsApiCall)
GO

-- //@UNDO
-- SQL to undo the change goes here.

drop table [dbo].[SMSSendHistory]
GO
