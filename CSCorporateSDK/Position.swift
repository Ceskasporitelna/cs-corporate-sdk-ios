//
//  Position.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Position: WebApiEntity
{
    /**
     * Position identifier.
     */
    public internal(set) var id:                                  UInt64!
    
    /**
     * Position code.
     */
    public internal(set) var positionCode:                        String?
    
    /**
     * Position description.
     */
    public internal(set) var descriptionI18N:                     String?
    
    /**
     * Company code.
     */
    public internal(set) var companyCode:                         String?
    
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
        self.id                               <- (map["id"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.positionCode                     <- map["positionCode"]
        self.descriptionI18N                  <- map["descriptionI18N"]
        self.companyCode                      <- map["companyCode"]
        
        super.mapping( map )
    }
    
}
