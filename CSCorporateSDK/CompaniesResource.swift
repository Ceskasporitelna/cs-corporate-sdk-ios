//
//  CompaniesResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 14/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation
import CSCoreSDK

//==============================================================================
public class CompaniesResource: Resource, ListEnabled, HasInstanceResource
{
    
    //--------------------------------------------------------------------------
    public func list(_ callback: @escaping (_ result: CoreResult<ListResponse<Company>>) -> Void)
    {
        ResourceUtils.CallList(self, parameters: nil, transform: nil, callback: callback);
    }
    
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> CompanyResource
    {
        return CompanyResource(id: id, path: self.path, client: self.client);
    }
}
