-- // add reverse payment table
-- Migration SQL that makes the change goes here.
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[ReversePaymentTracking]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    BEGIN

        CREATE TABLE [dbo].[ReversePaymentTracking](
                                                       [ReversePaymentTrackingID] [int] IDENTITY(1,1) NOT NULL,
                                                       [PaymentID] [int] NULL,
                                                       [ReversePaymentID] [int] NOT NULL,
                                                       [TicketID] [int] NULL,
                                                       [Amount] [money] NULL,
                                                       CONSTRAINT [PK_ReversePaymentTracking] PRIMARY KEY CLUSTERED
                                                           (
                                                            [ReversePaymentTrackingID] ASC
                                                               )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]

        ALTER TABLE [dbo].[ReversePaymentTracking]  WITH CHECK ADD  CONSTRAINT [FK_ReversePaymentTracking_PaymentID] FOREIGN KEY([PaymentID])
            REFERENCES [dbo].[Payment] ([paymentNumber])

        ALTER TABLE [dbo].[ReversePaymentTracking] CHECK CONSTRAINT [FK_ReversePaymentTracking_PaymentID]

        ALTER TABLE [dbo].[ReversePaymentTracking]  WITH CHECK ADD  CONSTRAINT [FK_ReversePaymentTracking_ReversePaymentID] FOREIGN KEY([ReversePaymentID])
            REFERENCES [dbo].[Payment] ([paymentNumber])

        ALTER TABLE [dbo].[ReversePaymentTracking] CHECK CONSTRAINT [FK_ReversePaymentTracking_ReversePaymentID]

        ALTER TABLE [dbo].[ReversePaymentTracking]  WITH CHECK ADD  CONSTRAINT [FK_ReversePaymentTracking_TicketID] FOREIGN KEY([TicketID])
            REFERENCES [dbo].[Ticket] ([ticketNumber])

        ALTER TABLE [dbo].[ReversePaymentTracking] CHECK CONSTRAINT [FK_ReversePaymentTracking_TicketID]

    END

GO


-- //@UNDO
-- SQL to undo the change goes here.


