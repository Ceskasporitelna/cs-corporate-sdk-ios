//
//  RelationshipManager.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 21/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipManager: WebApiEntity
{
    /**
     * The position identifier.
     */
    public internal(set) var id:                                  String!
    
    /**
     * The position name.
     */
    public internal(set) var name:                                String!
    
    /**
     * Marks a positions as primary for a client.
     */
    public internal(set) var primaryFlag:                         Bool?
    
    /**
     * List of branch specialists in this position.
     */
    public internal(set) var employees:                           [ListingEmployee]?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.id                              = String()
        self.name                            = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                               <- map["id"]
        self.name                             <- map["name"]
        self.primaryFlag                      <- map["primaryFlag"]
        self.employees                        <- map["employees"]
        
        super.mapping( map )
    }
    
}
