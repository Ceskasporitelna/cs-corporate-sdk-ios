//
//  RelationshipManagerPhotoParameters.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipManagerPhotoParameters : Parameters
{
    public var type : RelationshipManagerPhotoType?
    
    //--------------------------------------------------------------------------
    public init(type: RelationshipManagerPhotoType?)
    {
        self.type = type
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params           = super.toDictionary(existingParams)
        
        if let type = self.type {
            params ["type"] = type.value as AnyObject?
        }
        
        return params
    }
}
