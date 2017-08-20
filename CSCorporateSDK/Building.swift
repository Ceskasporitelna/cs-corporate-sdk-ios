//
//  Building.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Building: WebApiEntity
{
    /**
     * Building identifier.
     */
    public internal(set) var id:                                  UInt64!
    
    /**
     * Company code.
     */
    public internal(set) var companyCode:                         String?
    
    /**
     * Street name of a building.
     */
    public internal(set) var street:                              String?
    
    /**
     * City of a building.
     */
    public internal(set) var city:                                String?
    
    /**
     * Postcode of a building.
     */
    public internal(set) var postCode:                            String?
    
    /**
     * Building country info.
     */
    public internal(set) var country:                             Country?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id = UInt64()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                               <- (map["id"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.companyCode                      <- map["companyCode"]
        self.street                           <- map["email"]
        self.city                             <- map["city"]
        self.postCode                         <- map["postCode"]
        self.country                          <- map["country"]
        
        super.mapping( map )
    }
    
}
