//
//  CorporateClient.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 14/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class CorporateClient: WebApiClient
{
    class var clientPath: String {
        return "/api/v1"
    }
    
    class var basePath: String {
        return "corporate/our"
    }
    
    //---------------------------------------------------------------------------
    public var companies: CompaniesResource {
        return CompaniesResource( path: self.pathAppendedWith(type(of: self).basePath + "/companies"), client: self )
    }
    
    //---------------------------------------------------------------------------
    public var accounts: AccountsResource {
        return AccountsResource( path: self.pathAppendedWith(type(of: self).basePath + "/accounts"), client: self )
    }
    
    //--------------------------------------------------------------------------
    public convenience init( config: WebApiConfiguration )
    {
        self.init( config: config, apiBasePath: type(of: self).clientPath)
    }
    
}
