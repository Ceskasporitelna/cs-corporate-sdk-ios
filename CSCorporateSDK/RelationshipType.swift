//
//  RelationshipType.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 14/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipType: WebApiEntity
{
    /**
     * Code of type of the relationship (codebook).
     */
    public internal(set) var relationshipType:                    String!
    
    /**
     * Name of the relationship type (like '100% Vlastník').
     */
    public internal(set) var relationshipTypeI18N:                String!
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.relationshipType     = String()
        self.relationshipTypeI18N = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map);
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.relationshipType                 <- map["relationshipType"]
        self.relationshipTypeI18N             <- map["relationshipTypeI18N"]
        
        super.mapping( map )
    }
    
}
