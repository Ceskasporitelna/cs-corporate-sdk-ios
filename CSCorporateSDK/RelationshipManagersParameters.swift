//
//  RelationshipManagersParameters.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 21/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipManagersParameters : Parameters
{
    public var filter : RelationshipManagersFilterType?
    
    //--------------------------------------------------------------------------
    public init(filter: RelationshipManagersFilterType?)
    {
        self.filter = filter
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params           = super.toDictionary(existingParams)
        
        let formatter        = DateFormatter()
        formatter.dateFormat = Corporate.DateTimeFormat
        
        if let filter = self.filter {
            params ["filter"] = filter.value as AnyObject?
        }
        
        return params
    }
}
