//
//  AccountOwnerCompany.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 29/06/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountOwnerCompany: WebApiEntity
{
    /**
     * The registration number (ICO).
     */
    public internal(set) var regNum:                              String!
    
    /**
     * The name of the company.
     */
    public internal(set) var name:                                String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.regNum = String()
        self.name   = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map);
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.regNum                <- map["regNum"]
        self.name                  <- map["name"]
        
        super.mapping( map )
    }
    
}
