//
//  AccountsResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation
import CSCoreSDK

//==============================================================================
public class AccountsResource: Resource, PaginatedListEnabled, HasInstanceResource
{
    //--------------------------------------------------------------------------
    public func list(_ params: AccountsParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<Account>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "accounts", parameters: params.toDictionary(nil), transform: nil, callback: callback)
    }
    
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> AccountResource
    {
        return AccountResource(id: id, path: self.path, client: self.client);
    }
}
