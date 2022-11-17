-- // add credit card domain table
-- Migration SQL that makes the change goes here.
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[CreditCardProcessorDomain]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    BEGIN

        CREATE TABLE [dbo].[CreditCardProcessorDomain](
                                                          [CreditCardProcessorDomainID] [tinyint] IDENTITY(1,1) NOT NULL,
                                                          [Description] [nvarchar](50) NOT NULL,
                                                          [URL]   [nvarchar](100) NULL,
                                                          [API_Key] [nvarchar](50) NULL
        ) ON [PRIMARY]

    END
GO

delete CreditCardProcessorDomain
GO

IF NOT EXISTS(SELECT NULL FROM dbo.CreditCardProcessorDomain WHERE RTRIM(Description) = 'None')
    INSERT INTO dbo.CreditCardProcessorDomain (Description)
    VALUES ('None')

IF NOT EXISTS(SELECT NULL FROM dbo.CreditCardProcessorDomain WHERE RTRIM(Description) = 'XCharge')
    INSERT INTO dbo.CreditCardProcessorDomain (Description)
    VALUES ('XCharge')

IF NOT EXISTS(SELECT NULL FROM dbo.CreditCardProcessorDomain WHERE RTRIM(Description) = 'Clearent')
    INSERT INTO dbo.CreditCardProcessorDomain (Description, URL, API_Key)
    VALUES ('Clearent', 'https://gateway-sb.clearent.net', 'bf34cf152d45427e86dd02d5829d6db1')
GO

IF NOT EXISTS(SELECT * FROM SYSCOLUMNS WHERE NAME = 'CreditCardProcessorDomainID' and ID=OBJECT_ID(N'[dbo].[MiscSetup]'))
    BEGIN
        ALTER TABLE dbo.MiscSetup
            ADD CreditCardProcessorDomainID TINYINT NOT NULL
                CONSTRAINT DF_MiscSetup_CreditCardProcessorDomainID DEFAULT 2;

    END
GO

IF (select enableXcharge from MiscSetup) = 1
    update MiscSetup set CreditCardProcessorDomainID = (select  CreditCardProcessorDomainID from CreditCardProcessorDomain where Description = 'XCharge')
ELSE
    update MiscSetup set CreditCardProcessorDomainID = (select  CreditCardProcessorDomainID from CreditCardProcessorDomain where Description = 'None')
GO

-- //@UNDO
-- SQL to undo the change goes here.

