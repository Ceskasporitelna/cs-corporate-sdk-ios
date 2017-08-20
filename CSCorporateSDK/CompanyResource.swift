//
//  CompanyResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation
import CSCoreSDK

//==============================================================================
public class CompanyResource: InstanceResource, GetEnabled
{
    /**
     * Get information about the company's campaigns
     */
    //--------------------------------------------------------------------------
    public var campaigns: CampaignsResource {
        return CampaignsResource( path: self.path + "/campaigns", client: self.client )
    }
    
    /**
     * Get information about the company's relationship managers
     */
    //--------------------------------------------------------------------------
    public var relationshipManagers: RelationshipManagersResource {
        return RelationshipManagersResource( path: self.path + "/relationshipmanagers", client: self.client )
    }
    
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<Company>) -> Void)
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
}
