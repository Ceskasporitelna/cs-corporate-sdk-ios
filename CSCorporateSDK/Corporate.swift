//
//  CSCorporate.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation
import CSCoreSDK


//------------------------------------------------------------------------------
public class Corporate
{
    public static let BundleIdentifier = "cz.applifting.CSCorporate"
    public static let DateTimeFormat   = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    public static let DateFormat       = "yyyy-MM-dd"
    
    //--------------------------------------------------------------------------
    public class var sharedInstance: Corporate {
        if let instance = _sharedInstance{
            return instance
        }else{
            let instance = Corporate()
            _sharedInstance = instance
            return instance
        }
    }
    fileprivate static var _sharedInstance : Corporate?
    
    //--------------------------------------------------------------------------
    public internal (set) var client: CorporateClient!
    
    
    fileprivate convenience init()
    {
        let configuration = CoreSDK.sharedInstance.webApiConfiguration
        let apiUrl = URL( string: configuration.environment.apiContextBaseUrl )
        if apiUrl == nil{
            assert( false, "Wrong or missing apiContextBaseUrl!" )
        }
        
        self.init( webApiConfiguration: configuration )
    }
    
    fileprivate init( webApiConfiguration : WebApiConfiguration )
    {
        self.client = CorporateClient( config: webApiConfiguration )
    }

}
