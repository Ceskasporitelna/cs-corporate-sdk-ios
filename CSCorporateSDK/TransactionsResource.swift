//
//  TransactionsResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 19/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class TransactionsResource: Resource, PaginatedListEnabled
{
    //--------------------------------------------------------------------------
    public func list(_ params: TransactionsParameters, callback: @escaping (_ result: CoreResult<PaginatedListResponse<Transaction>>) -> Void)
    {
        ResourceUtils.CallPaginatedList(self, itemJSONKey: "transactions", parameters: params.toDictionary(nil), transform: nil, callback: callback)
    }
}
