//
//  Transaction.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 19/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Transaction: WebApiEntity
{
    /**
     * The transaction reference ID.
     */
    public internal(set) var transactionId:                       String?
    
    /**
     * The transaction accountParty info.
     */
    public internal(set) var accountParty:                        AccountNumber!
    
    /**
     * The transaction amount info.
     */
    public internal(set) var amount:                              Amount!
    
    /**
     * The transaction amount sender info.
     */
    public internal(set) var amountSender:                        Amount!
    
    /**
     * The date of booking.
     */
    public internal(set) var bookingDate:                         Date?
    
    /**
     * The number of card used in transaction.
     */
    public internal(set) var cardNumber:                          String?
    
    /**
     * The constant symbol.
     */
    public internal(set) var constantSymbol:                      String?
    
    /**
     * The conversion rates in EUR.
     */
    public internal(set) var currRateEURValue:                    String?
    
    /**
     * The date of conversion.
     */
    public internal(set) var currRateEURDate:                     Date?
    
    /**
     * The user description of the transaction.
     */
    public internal(set) var description:                         String?
    
    /**
     * The note for payee ("zpráva pro příjemce"). Up to 140 chars. 
     * For foreign transactions, additional info about currency rate etc.
     */
    public internal(set) var payeeNote:                           String?
    
    /**
     * The note for payer ("zpráva pro mě"). Up to 140 chars.
     */
    public internal(set) var payerNote:                           String?
    
    /**
     * The specific symbol.
     */
    public internal(set) var specificSymbol:                      String?
    
    /**
     * The type of transaction.
     */
    public internal(set) var transactionType:                     String!
    
    /**
     * The localized type of transaction.
     */
    public internal(set) var transactionTypeI18N:                 String!
    
    /**
     * The date of valuation.
     */
    public internal(set) var valuationDate:                       Date?
    
    /**
     * The variable symbol.
     */
    public internal(set) var variableSymbol:                      String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.transactionType     = String()
        self.accountParty        = AccountNumber()
        self.amount              = Amount()
        self.amountSender        = Amount()
        self.transactionTypeI18N = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.transactionId          <- map["transactionId"]
        self.accountParty           <- map["accountParty"]
        self.amount                 <- map["amount"]
        self.amountSender           <- map["amountSender"]
        self.bookingDate            <- (map["bookingDate"], CustomDateFormatTransform(formatString: Corporate.DateTimeFormat))
        self.cardNumber             <- map["cardNumber"]
        self.constantSymbol         <- map["constantSymbol"]
        self.currRateEURValue       <- map["currRateEURValue"]
        self.currRateEURDate        <- map["currRateEURDate"]
        self.description            <- map["description"]
        self.payeeNote              <- map["payeeNote"]
        self.payerNote              <- map["payerNote"]
        self.specificSymbol         <- map["specificSymbol"]
        self.transactionType        <- map["transactionType"]
        self.transactionTypeI18N    <- map["transactionTypeI18N"]
        self.valuationDate          <- (map["valuationDate"], CustomDateFormatTransform(formatString: Corporate.DateTimeFormat))
        self.variableSymbol         <- map["variableSymbol"]

        super.mapping( map )
    }
    
}
