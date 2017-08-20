//
//  AccountNumber.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 19/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountNumber: WebApiEntity
{
    /**
     * The account number of the transaction party.
     */
    public internal(set) var accountNumber:                       String?
    
    /**
     * The account prefix of the transaction party.
     */
    public internal(set) var accountPrefix:                       String?
    
    /**
     * The account bank code of the transaction party.
     */
    public internal(set) var bankCode:                            String?
    
    /**
     * The id of bank/branch, constant for domestic accounts in csas.
     */
    public internal(set) var bic:                                 String?
    
    /**
     * The account number of transaction party in IBAN format.
     */
    public internal(set) var iban:                                String?
    
    /**
     * Name of transaction party. For ATM transaction, masked card number used in transaction.
     */
    public internal(set) var accountPartyInfo:                    String?
    
    /**
     * Whole account number including bank of transaction party. 
     * For ATM transaction, address of ATM if known. 
     * For card transaction, identification (name) of the merchant.
     */
    public internal(set) var accountPartyDescription:             String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.iban                    <- map["iban"]
        self.accountPrefix           <- map["accountPrefix"]
        self.accountNumber           <- map["accountNumber"]
        self.bankCode                <- map["bankCode"]
        self.bic                     <- map["bic"]
        self.accountPartyInfo        <- map["accountPartyInfo"]
        self.accountPartyDescription <- map["partyDescription"]
        
        super.mapping( map )
    }
    
}
