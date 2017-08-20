//
//  AccountResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 18/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountResource: InstanceResource
{
    /**
     * Get information about the company's campaigns.
     */
    //--------------------------------------------------------------------------
    public var balance: BalanceResource {
        return BalanceResource( path: self.path + "/balance", client: self.client )
    }
    
    /**
     * Get information about the company's transactions.
     */
    //--------------------------------------------------------------------------
    public var transactions: TransactionsResource {
        return TransactionsResource( path: self.path + "/transactions", client: self.client )
    }
}
