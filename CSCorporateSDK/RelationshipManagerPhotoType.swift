//
//  RelationshipManagerPhotoType.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

fileprivate let BWType           = "BW"
fileprivate let ThumbnailType    = "THUMBNAIL"
fileprivate let MiniType         = "MINI"
fileprivate let StandardType     = "STANDARD"
fileprivate let LargeType        = "LARGE"

//==============================================================================
public enum RelationshipManagerPhotoType: Transformable
{
    /**
     * Photo of BW filter type.
     */
    case bw
    
    /**
     * Thumbnail relationship manager photo type.
     */
    case thumbnail
    
    /**
     * Mini relationship manager photo type.
     */
    case mini
    
    /**
     * Standard relationship manager photo type.
     */
    case standard
    
    /**
     * Large relationship manager photo type.
     */
    case large
    
    /**
     * Other photo filter type.
     */
    case other(value : String)
    
    var value : String {
        switch self {
        case .bw:
            return BWType
        case .thumbnail:
            return ThumbnailType
        case .mini:
            return MiniType
        case .standard:
            return StandardType
        case .large:
            return LargeType
        case .other(let value):
            return value
        }
    }
    
    //--------------------------------------------------------------------------
    public static func enumerate(string: String) -> RelationshipManagerPhotoType
    {
        switch string {
        case BWType:
            return .bw
        case ThumbnailType:
            return .thumbnail
        case MiniType:
            return .mini
        case StandardType:
            return .standard
        case LargeType:
            return .large
    
        default:
            return .other(value: string)
        }
    }
    
    //--------------------------------------------------------------------------
    public static func transform() -> TransformOf<RelationshipManagerPhotoType, String>
    {
        return TransformOf<RelationshipManagerPhotoType, String>(
            fromJSON: { (value: String?) -> RelationshipManagerPhotoType? in
                if let value = value {
                    return self.enumerate(string: value)
                }
                return nil
        },
            toJSON: { (value: RelationshipManagerPhotoType?) -> String? in
                if let value = value {
                    return value.value
                }
                return nil
        })
    }
}

