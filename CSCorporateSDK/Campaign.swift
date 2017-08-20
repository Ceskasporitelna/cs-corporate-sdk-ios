//
//  Campaign.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Campaign: WebApiEntity
{
    /**
     * Id of a campaign.
     */
    public internal(set) var id:                                  UInt64!
    
    /**
     * Name of campaign.
     */
    public internal(set) var name:                                String!
    
    /**
     * End date of a campaign.
     */
    public internal(set) var endDate:                             Date!
    
    /**
     * Channel of a campaign.
     */
    public internal(set) var channel:                             String!

    /**
     * The campaign comment.
     */
    public internal(set) var comment:                             String!

    /**
     * Target number group.
     */
    public internal(set) var targetListId:                        UInt64!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id           = UInt64()
        self.name         = String()
        self.endDate      = Date()
        self.channel      = String()
        self.comment      = String()
        self.targetListId = UInt64()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map);
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                    <- (map["id"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.name                  <- map["name"]
        self.endDate               <- (map["endDate"], CustomDateFormatTransform(formatString: CSCorporateSDK.DateTimeFormat))
        self.channel               <- map["channel"]
        self.name                  <- map["name"]
        self.comment               <- map["comment"]
        self.targetListId          <- (map["targetListId"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        
        super.mapping( map )
    }
    
}

