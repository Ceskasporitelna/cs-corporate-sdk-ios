//
//  RelationshipManagerPhotoInfoResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 23/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipManagerPhotoInfoResource: Resource, GetEnabled
{
    /**
     * Get info about the photo.
     */
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<RelationshipManagerPhotoInfo>) -> Void)
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
}
