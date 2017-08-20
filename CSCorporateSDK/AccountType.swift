//
//  AccountType.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 29/06/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

fileprivate let C_AccountType    = "C"
fileprivate let S_AccountType    = "S"
fileprivate let M_AccountType    = "M"
fileprivate let N_AccountType    = "N"

//==============================================================================
public enum AccountType: Transformable
{
    /**
     * C account type.
     */
    case c
    
    /**
     * S account type.
     */
    case s
    
    /**
     * M account type.
     */
    case m
    
    /**
     * N account type.
     */
    case n
    
    /**
     * Other account type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .c:
            return C_AccountType
        case .s:
            return S_AccountType
        case .m:
            return M_AccountType
        case .n:
            return N_AccountType
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> AccountType
    {
        switch string {
        case C_AccountType:
            return .c
        case S_AccountType:
            return .s
        case M_AccountType:
            return .m
        case N_AccountType:
            return .n
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<AccountType, String>
    {
        return TransformOf<AccountType, String>(
            fromJSON: { (value: String?) -> AccountType? in
                if let value = value {
                    return self.enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: AccountType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}


