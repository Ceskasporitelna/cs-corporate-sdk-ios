//
//  Country.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Country: WebApiEntity
{
    /**
     * Country code of a building.
     */
    public internal(set) var country:                                String?
    
    /**
     * Localized country name.
     */
    public internal(set) var nameI18N:                               String?
    
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
        self.country                             <- map["country"]
        self.nameI18N                            <- map["nameI18N"]
        
        super.mapping( map )
    }
    
}
