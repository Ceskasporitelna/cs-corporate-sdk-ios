//
//  AccountNo.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountNo: WebApiEntity
{
    /**
     * IBAN.
     */
    public internal(set) var iban:                                String?
    
    /**
     * Prefix of the bank account number.
     */
    public internal(set) var accountPrefix:                       String?
    
    /**
     * Number of the bank account.
     */
    public internal(set) var accountNumber:                       String!
    
    /**
     * Bank code of the account.
     */
    public internal(set) var bankCode:                            String!
    
    /**
     * The id of bank/branch, constant for domestic accounts in csas.
     */
    public internal(set) var bic:                                 String?
    
    /**
     * The account party info.
     */
    public internal(set) var accountPartyInfo:                    String?
    
    /**
     * The account party description.
     */
    public internal(set) var accountPartyDescription:             String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.accountNumber = String()
        self.bankCode      = String()
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
        self.accountPartyDescription <- map["accountPartyDescription"]
        
        super.mapping( map )
    }

}
