//
//  BalanceResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 18/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class BalanceResource: Resource, GetEnabled
{
    //--------------------------------------------------------------------------
    public func get(_ callback: @escaping (_ result: CoreResult<AccountBalance>) -> Void)
    {
        ResourceUtils.CallGet(self, parameters: nil, transform: nil, callback: callback)
    }
}
