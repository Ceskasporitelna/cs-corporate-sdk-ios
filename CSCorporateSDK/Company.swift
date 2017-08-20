//
//  Company.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 14/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Company: WebApiEntity
{
    /**
     * The registration number (ICO).
     */
    public internal(set) var regNum:                              String!
    
    /**
     * The taxation number (DIC).
     */
    public internal(set) var taxNum:                              String?
    
    /**
     * The legal form of the company (codebook).
     */
    public internal(set) var legalForm:                           String?
    
    /**
     * The localized name of the legal form of the company.
     */
    public internal(set) var legalFormI18N:                       String?
    
    /**
     * The name of the company.
     */
    public internal(set) var name:                                String!
    
    /**
     * Profile data (like industry sector).
     */
    public internal(set) var companyProfile:                      CompanyProfile?
    
    /**
     * Type of relationship.
     */
    public internal(set) var relationshipType:                    RelationshipType?
    
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.regNum = String()
        self.name   = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map);
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.regNum                <- map["regNum"]
        self.taxNum                <- map["taxNum"]
        self.legalForm             <- map["legalForm"]
        self.legalFormI18N         <- map["legalFormI18N"]
        self.name                  <- map["name"]
        self.companyProfile        <- map["companyProfile"]
        self.relationshipType      <- map["relationshipType"]
        
        super.mapping( map )
    }

}
