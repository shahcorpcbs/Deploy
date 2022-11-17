-- // add sendgrid params
-- Migration SQL that makes the change goes here.
alter table MiscSetup add useSendGrid bit not null DEFAULT 0
GO
ALTER TABLE MiscSetup ADD sendGridAPIKey VARCHAR(128);
GO
ALTER TABLE MiscSetup ADD sendGridFromAddress VARCHAR(128);
GO
ALTER TABLE MiscSetup ADD sendGridReplyToAddress VARCHAR(128);
GO

alter table SmsMessage add useEmailForm bit not null DEFAULT 0
GO
alter table SmsMessage add emailFormId varchar(64)
GO

alter table EmailHistory add sendAsAttachment bit not null default 0
GO

alter table EmailHistory add formatType smallint not null default 1
GO

EXEC sp_RENAME 'EmailHistory.SentTime' , 'RequestDate', 'COLUMN'
GO

alter table EmailHistory add fromAddress varchar(54)
GO

alter table EmailHistory add replyAddress varchar(54)
GO

alter table EmailHistory add subject text
GO

alter table EmailHistory add message text
GO

alter table EmailHistory add queueStatus smallint not null default 0
GO

alter table EmailHistory add isHtml bit not null default 0
GO

alter table EmailHistory add usedSendGrid bit not null default 0
GO

alter table EmailHistory add errorMessage text
GO

alter table EmailHistory add category varchar(54)
GO

alter table EmailHistory add reportText text
GO

alter table EmailHistory add lastAttempt DateTime
GO

update EmailHistory set EmailHistory.queueStatus = 1
GO

update EmailHistory set Message = Text
GO

ALTER TABLE EmailHistory DROP COLUMN Text
GO

-- //@UNDO
-- SQL to undo the change goes here.


