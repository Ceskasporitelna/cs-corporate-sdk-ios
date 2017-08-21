//
//  AccountBalance.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 18/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountBalance: WebApiEntity
{
    /**
     * Ledger balance info.
     */
    public internal(set) var balance:                             Amount!
    
    /**
     * Current available balance info.
     */
    public internal(set) var disposable:                          Amount?
    
    /**
     * Minimal balance to be kept.
     */
    public internal(set) var minBalance:                          Int?
    
    /**
     * Overdraft info.
     */
    public internal(set) var overdraft:                           Amount?
    
    /**
     * Overdraft due date.
     */
    public internal(set) var overdraftDueDate:                    Date?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.balance = Amount()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.balance               <- map["balance"]
        self.disposable            <- map["disposable"]
        self.minBalance            <- map["minBalance"]
        self.overdraft             <- map["overdraft"]
        self.overdraftDueDate      <- (map["overdraftDueDate"], CustomDateFormatTransform(formatString: Corporate.DateFormat))
        
        super.mapping( map )
    }
    
}
