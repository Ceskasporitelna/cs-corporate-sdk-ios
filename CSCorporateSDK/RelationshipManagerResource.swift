//
//  RelationshipManagerResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 21/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipManagerResource: InstanceResource, GetEnabled
{
    /**
     * Get information about the company's relationship managers
     */
    //--------------------------------------------------------------------------
    public var photo: RelationshipManagerPhotoResource {
        return RelationshipManagerPhotoResource( path: self.path + "/photo", client: self.client )
    }
    
    /**
     * Returns RelationshipManagerResource for a given employee id
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<EmployeeDetail>) -> Void)
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
}
