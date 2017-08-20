//
//  GenderType.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

fileprivate let MaleType    = "M"
fileprivate let FemaleType  = "F"

//==============================================================================
public enum GenderType: Transformable
{
    /**
     * The male gender type.
     */
    case male
    
    /**
     * The female gender type.
     */
    case female
    
    /**
     * Other relationship manager filter type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .male:
            return MaleType
        case .female:
            return FemaleType
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> GenderType
    {
        switch string {
        case MaleType:
            return .male
        case FemaleType:
            return .female
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<GenderType, String>
    {
        return TransformOf<GenderType, String>(
            fromJSON: { (value: String?) -> GenderType? in
                if let value = value {
                    return self.enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: GenderType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}

