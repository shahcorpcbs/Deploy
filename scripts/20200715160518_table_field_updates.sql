ALTER TABLE shahcorp.dbo.MiscSetup ADD useTookan bit NOT NULL DEFAULT 0;
ALTER TABLE shahcorp.dbo.MiscSetup ADD tookanUsername VARCHAR(50);
ALTER TABLE shahcorp.dbo.MiscSetup ADD tookanPassword VARCHAR(20);
ALTER TABLE shahcorp.dbo.MiscSetup ADD tookanApiKey VARCHAR(128);
ALTER TABLE shahcorp.dbo.MiscSetup ADD tookanTimeZoneId INT NOT NULL DEFAULT 360;
ALTER TABLE shahcorp.dbo.MiscSetup ADD tookanMerchantId INT DEFAULT NULL;
ALTER TABLE shahcorp.dbo.MiscSetup ADD tookanTeamId INT  DEFAULT NULL;
ALTER TABLE shahcorp.dbo.MiscSetup ADD tookanDeliveryByHour int NOT NULL DEFAULT 16;

ALTER TABLE shahcorp.dbo.MiscSetup ADD useTwilio bit NOT NULL DEFAULT 0;
ALTER TABLE shahcorp.dbo.MiscSetup ADD enableDailyAlerts bit NOT NULL DEFAULT 0;
ALTER TABLE shahcorp.dbo.MiscSetup ADD twilioAccountSid VARCHAR(128);
ALTER TABLE shahcorp.dbo.MiscSetup ADD twilioAuthToken VARCHAR(128);
ALTER TABLE shahcorp.dbo.MiscSetup ADD twilioFromNumber VARCHAR(12);
ALTER TABLE shahcorp.dbo.MiscSetup ADD twilioAlertMessage VARCHAR(2048);

ALTER TABLE shahcorp.dbo.MiscSetup ADD combineRoutes bit NOT NULL DEFAULT 0;
ALTER TABLE shahcorp.dbo.MiscSetup ADD onlyRacked bit NOT NULL DEFAULT 0;

ALTER TABLE shahcorp.dbo.Customer ADD cellPhone VARCHAR(16);
ALTER TABLE shahcorp.dbo.Customer ADD sendTextAlert bit NOT NULL DEFAULT 0;
ALTER TABLE shahcorp.dbo.Customer ADD smsAlertMessageId bigint NOT NULL DEFAULT 1;
ALTER TABLE shahcorp.dbo.Customer ADD twilioBlackList bit NOT NULL DEFAULT 0;
ALTER TABLE shahcorp.dbo.Customer ADD twilioValidPhoneNumber bit DEFAULT NULL;
ALTER TABLE shahcorp.dbo.Customer ADD lastSentTwilioAlert smalldatetime NULL;


ALTER TABLE shahcorp.dbo.DeliveryStop ADD skipMessageId int NULL;
ALTER TABLE shahcorp.dbo.DeliveryStop ADD tookanJobId VARCHAR(16) NULL;
GO

CREATE INDEX IDX_DeliveryStop_DeliveryStopID_RouteID ON DeliveryStop (RouteID);
GO