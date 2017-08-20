//
//  Amount.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 18/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Amount: WebApiEntity
{
    /**
     * Current ledger balance.
     */
    public internal(set) var value:                               Int64!
    
    /**
     * Value precision, currently always 2 (constant).
     */
    public internal(set) var precision:                           Int!
    
    /**
     * Currency of the bank account.
     */
    public internal(set) var currency:                            Currency!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.value     = Int64()
        self.precision = Int()
        self.currency  = .other(value: "")
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.value                 <- (map["value"], TransformOf<Int64, NSNumber>(fromJSON: { $0?.int64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.precision             <- map["precision"]
        self.currency              <- (map["currency"], Currency.transform())
        
        super.mapping( map )
    }
    
}
