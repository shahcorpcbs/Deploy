-- // void table
-- Migration SQL that makes the change goes here.
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[VoidPayment]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[VoidPayment]
GO

CREATE PROCEDURE dbo.VoidPayment
@PaymentType			CHAR(11) -- 'Cash', 'Check', 'Credit Card', 'On Account'
, @SalePaymentNumber		INT
, @EmployeeID				INT
, @TerminalID				INT
, @CardPaymentID          INT = NULL -- Only necessary for credit card payments
AS
BEGIN

    DECLARE @PaymentDate		DATETIME = GETDATE();
    DECLARE @PaymentGroupID		INT;
    DECLARE @PaymentID			INT;
    DECLARE @GeneralLedgerID	INT;

    DECLARE @PaymentGroupDescription	VARCHAR(255);
    DECLARE @StoreID					INT;
    DECLARE @CustomerSequenceNumber		INT;
    DECLARE @AmountPaid					MONEY;
    DECLARE @PaymentTypeName			VARCHAR(20);
    DECLARE @CheckOrCardNumber			VARCHAR(50);
    DECLARE @CreditCardExpiryDate		CHAR(4);
    DECLARE @CreditCardTypeID			INT;
    DECLARE @SaleTransactionNumber		CHAR(32);
    DECLARE @CreatedDate				DATETIME;
    DECLARE @CreatedEmployeeID			INT;
    DECLARE @HardwareID					INT;
    DECLARE @ReceiptNumber				VARCHAR(50);
    DECLARE @CreditCardType				VARCHAR(20);
    DECLARE @TicketStatus				VARCHAR(2);
    DECLARE @VoidTransactionID		    VARCHAR(40);


    SELECT @StoreID = p.storeID
         , @CustomerSequenceNumber = p.customerSequenceNumber
         , @AmountPaid = p.amountPaid
         , @CheckOrCardNumber = p.checkOrCardNumber
         , @CreditCardExpiryDate = p.creditCardExpiryDate
         , @CreditCardTypeID = p.creaditCardTypeID
         , @CreditCardType = p.CreditCardType
         , @PaymentGroupDescription = pg.paymentGroupDescription
    FROM dbo.Payment p
             JOIN dbo.PaymentGroup pg
                  ON p.paymentGroupNumber = pg.paymentGroupNumber
    WHERE p.paymentNumber = @SalePaymentNumber;

    INSERT PaymentGroup(createdDate, paymentGroupDescription)
    VALUES (@PaymentDate, @PaymentGroupDescription);

    SELECT @PaymentGroupID = SCOPE_IDENTITY();

    IF @PaymentType = 'Credit Card'
        BEGIN
            SELECT @VoidTransactionID = CardVoidId
            FROM dbo.CardVoid
            WHERE CardPaymentId = @CardPaymentID;
        END

    INSERT Payment([storeID], [customerSequenceNumber], [paymentDate], [amountPaid], [paymentTypeName],
                   [checkOrCardNumber], [creditCardExpiryDate], [creditCardType], [approvalCode], [transactionNumber],
                   [createdDate], [createdEmployeeID], [terminalID], paymentgroupnumber)
    VALUES (@StoreID, @CustomerSequenceNumber, @PaymentDate, (-1)*@AmountPaid, @PaymentType,
            @CheckOrCardNumber, @CreditCardExpiryDate, @CreditCardType, NULL,
            @VoidTransactionID, @PaymentDate, @EmployeeID, @TerminalID, @PaymentGroupID)

    SELECT @PaymentID = SCOPE_IDENTITY()

    INSERT PaymentTracking(sourceRefNumber, sourceRefType, targetRefNumber, targetRefType, amountApplied, createdDate, createdByEmployeeID)
    SELECT @PaymentID, 'PA', t.ticketNumber, 'TI', (-1)*pt.amountApplied, @PaymentDate, @EmployeeID
    FROM dbo.PaymentTracking pt
             JOIN dbo.Ticket t
                  ON pt.targetRefNumber = t.ticketNumber
    WHERE pt.sourceRefType = 'PA'
      AND pt.targetRefType = 'TI'
      AND pt.sourceRefNumber = @SalePaymentNumber;



    SELECT @TicketStatus = ticketStatus
    FROM dbo.Ticket t
             JOIN dbo.PaymentTracking pt
                  ON t.ticketNumber = pt.targetRefNumber
    WHERE pt.sourceRefNumber = @SalePaymentNumber;

    IF @TicketStatus != 'FI'
        BEGIN

            UPDATE t
            SET t.amountPaid = t.amountPaid - pt.amountApplied
            FROM dbo.Ticket t
                     JOIN dbo.PaymentTracking pt
                          ON t.ticketNumber = pt.targetRefNumber
                              AND pt.targetRefType = 'TI'
                              AND pt.sourceRefNumber = @SalePaymentNumber
                              AND pt.sourceRefType = 'PA';
        END

    INSERT dbo.TicketEvent
    SELECT @EmployeeID
         , t.ticketNumber
         , @PaymentDate
         , 'PAYMENT'
         , 'Void'
         , 'Void Payment ' + RTRIM(CONVERT(VARCHAR(30), @AmountPaid))
         , t.amountPaid
         , pt.amountApplied
    FROM dbo.Ticket t
             JOIN dbo.PaymentTracking pt
                  ON t.ticketNumber = pt.targetRefNumber
                      AND pt.sourceRefNumber = @PaymentID;

    INSERT dbo.CustomerNote (CustomerSequenceNumber, StoreGUID, Source, Note)
    SELECT @CustomerSequenceNumber, s.GUID, e.EmployeeName, 'Void Payment ' + RTRIM(CONVERT(VARCHAR(30), @AmountPaid))
    FROM dbo.Store s,
         dbo.Employee e
    WHERE s.storeID = @StoreID
      AND e.employeeID = @EmployeeID;

    INSERT dbo.ReversePaymentTracking(PaymentID, ReversePaymentID)
    VALUES (@SalePaymentNumber, @PaymentID)

    IF @PaymentType = 'On Account' or @TicketStatus = 'FI'
        BEGIN
            INSERT GeneralLedger(customerSequenceNumber, refNumber, refType, refDescription, amountDue, termDate, createdDate, createdEmployeeID)
            VALUES (@CustomerSequenceNumber, @PaymentID, 'PA', 'Payment', @AmountPaid, @PaymentDate, @PaymentDate, @EmployeeID)

            SELECT @GeneralLedgerID = SCOPE_IDENTITY()

            INSERT PaymentTracking(sourceRefNumber, sourceRefType, targetRefNumber, targetRefType, amountApplied, createdDate, createdByEmployeeID)
            VALUES (@PaymentID, 'PA', @GeneralLedgerID, 'GL', (-1)*@AmountPaid, @PaymentDate, @EmployeeID)
        END

END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

GRANT EXECUTE  ON [dbo].[VoidPayment] TO [public]
GO



-- //@UNDO
-- SQL to undo the change goes here.


