//
//  RelationshipManagerPhotoResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipManagerPhotoResource: Resource
{
    /**
     * Get information about the photo.
     */
    //--------------------------------------------------------------------------
    public var info: RelationshipManagerPhotoInfoResource {
        return RelationshipManagerPhotoInfoResource( path: self.path + "/info", client: self.client )
    }
    
    /**
     * Downloads photo into file. Returns path to downloaded file in the callback, when success.
     */
    //--------------------------------------------------------------------------
    public func download(_ params: RelationshipManagerPhotoParameters, callback: @escaping (_ result: CoreResult<String>) -> Void)
    {
        ResourceUtils.CallDownload(method: .GET, resource: self, pathSuffix: nil, parameters: params.toDictionary(nil), contentType: "text/plain;charset=ISO-8859-1", callback: callback)
    }
}
