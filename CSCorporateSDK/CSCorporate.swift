//
//  CSCorporate.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation


//------------------------------------------------------------------------------
public class CSCorporate: NSObject
{
    public static let BundleIdentifier = "cz.applifting.CSCorporate"
    public static let DateTimeFormat   = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    public static let DateFormat       = "yyyy-MM-dd"
    
    //--------------------------------------------------------------------------
    class func getBundle() -> Bundle
    {
        let bundleForThisClass = Bundle(for: CSCorporate.classForCoder())
        if bundleForThisClass.bundleIdentifier == BundleIdentifier {
            return bundleForThisClass
        }
        else {
            return Bundle( url: bundleForThisClass.url(forResource: BundleIdentifier, withExtension: "bundle")!)!
        }
    }
    
    //--------------------------------------------------------------------------
    public class func localized( _ string: String ) -> String
    {
        return NSLocalizedString( string, tableName: nil, bundle: CSCorporate.getBundle(), value: "", comment: "")
    }
}
