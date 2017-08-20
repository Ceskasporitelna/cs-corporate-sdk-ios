//
//  RelationshipManagerPhotoInfo.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 23/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipManagerPhotoInfo: WebApiEntity
{
    /**
     * The employee identifier.
     */
    public internal(set) var empId:                               UInt64!
    
    /**
     * The agreement time.
     */
    public internal(set) var agreementDate:                       Date!
    
    /**
     * The agreement time.
     */
    public internal(set) var agreement:                           Bool!
    
    /**
     * The mime type of photos.
     */
    public internal(set) var mimeType:                            String!
    
    /**
     * The available types of photos.
     */
    public internal(set) var types:                               [String]!
    
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.empId         = UInt64()
        self.agreementDate = Date()
        self.agreement     = Bool()
        self.mimeType      = String()
        self.types         = []
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.empId                            <- (map["empId"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.agreementDate                    <- (map["agreementDate"], CustomDateFormatTransform(formatString: CSCorporateSDK.DateFormat))
        self.agreement                        <- map["agreement"]
        self.mimeType                         <- map["mimeType"]
        self.types                            <- map["types"]
        
        super.mapping( map )
    }
    
}
