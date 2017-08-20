//
//  CampaignsResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation
import CSCoreSDK

//==============================================================================
public class CampaignsResource: Resource, ListEnabled
{
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<Campaign>>) -> Void)
    {
        ResourceUtils.CallList(self, parameters: nil, transform: nil, callback: callback);
    }
}
