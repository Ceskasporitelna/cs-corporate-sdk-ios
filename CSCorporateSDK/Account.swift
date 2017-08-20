//
//  Account.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Account: WebApiEntity
{
    /**
     * Product instance id used to uniquely reference the particular product instance 
     * (IBAN is not always present and account number does not always uniquely identify an account/product instance)
     */
    public internal(set) var id:                                  String!
    
    /**
     * Account info object.
     */
    public internal(set) var accountNo:                           AccountNo?
    
    /**
     * Type of the bank account.
     */
    public internal(set) var accountType:                         AccountType!

    /**
     * Name of the bank account.
     */
    public internal(set) var accountName:                         String!
    
    /**
     * Currency of the bank account.
     */
    public internal(set) var currency:                            Currency!
    
    /**
     * Account owner.
     */
    public internal(set) var accountOwner:                        AccountOwner!

    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.id               = String()
        self.accountType      = .other(value: "")
        self.accountName      = String()
        self.currency         = .other(value: "")
        self.accountOwner     = AccountOwner()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                    <- map["id"]
        self.accountNo             <- map["accountNo"]
        self.accountType           <- (map["accountType"], AccountType.transform())
        self.accountName           <- map["accountName"]
        self.currency              <- (map["currency"], Currency.transform())
        self.accountOwner          <- map["accountOwner"]
        
        super.mapping( map )
    }
    
}


