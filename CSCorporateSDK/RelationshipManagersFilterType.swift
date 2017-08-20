//
//  RelationshipManagersFilterType.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 21/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

fileprivate let AllType        = "ALL"
fileprivate let PrimaryType    = "PRIMARY"

//==============================================================================
public enum RelationshipManagersFilterType: Transformable
{
    /**
     * All relationship manager filter type.
     */
    case all
    
    /**
     * Primary relationship manager filter type.
     */
    case primary
    
    /**
     * Other relationship manager filter type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .all:
            return AllType
        case .primary:
            return PrimaryType
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> RelationshipManagersFilterType
    {
        switch string {
        case AllType:
            return .all
        case PrimaryType:
            return .primary
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<RelationshipManagersFilterType, String>
    {
        return TransformOf<RelationshipManagersFilterType, String>(
            fromJSON: { (value: String?) -> RelationshipManagersFilterType? in
                if let value = value {
                    return self.enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: RelationshipManagersFilterType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}

