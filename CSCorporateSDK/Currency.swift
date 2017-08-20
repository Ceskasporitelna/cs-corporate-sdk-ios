//
//  Currency.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 29/06/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

fileprivate let CZK_Type    = "CZK"
fileprivate let USD_Type    = "USD"
fileprivate let EUR_Type    = "EUR"


//==============================================================================
public enum Currency: Transformable
{
    /**
     * CZK currency.
     */
    case czk
    
    /**
     * USD currency.
     */
    case usd
    
    /**
     * EUR currency.
     */
    case eur
    
    /**
     * Other currency.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .czk:
            return CZK_Type
        case .usd:
            return USD_Type
        case .eur:
            return EUR_Type
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> Currency
    {
        switch string {
        case CZK_Type:
            return .czk
        case USD_Type:
            return .usd
        case EUR_Type:
            return .eur
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<Currency, String>
    {
        return TransformOf<Currency, String>(
            fromJSON: { (value: String?) -> Currency? in
                if let value = value {
                    return self.enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: Currency?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}



