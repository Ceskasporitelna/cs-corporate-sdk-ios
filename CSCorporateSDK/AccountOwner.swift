//
//  AccountOwner.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 16/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountOwner: WebApiEntity
{
    /**
     * Company owns the account.
     */
    public internal(set) var company:                             AccountOwnerCompany?
    
    /**
     * Related person for given account.
     */
    public internal(set) var person:                              AccountOwnerPerson?
    
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
        self.company               <- map["company"]
        self.person                <- map["person"]
        
        super.mapping( map )
    }
    
}
