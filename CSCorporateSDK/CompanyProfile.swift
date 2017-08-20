//
//  CompanyProfile.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 14/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class CompanyProfile: WebApiEntity
{
    /**
     * Company type according to CNB (codebook).
     */
    public internal(set) var cnbType:                             String?
    
    /**
     * Localized name of the company type according to CNB.
     */
    public internal(set) var cnbTypeI18N:                         String?
    
    /**
     * The NACE industry code (codebook).
     */
    public internal(set) var industryCategory:                    String?
    
    /**
     * The Localized name of the NACE industry code.
     */
    public internal(set) var industryCategoryI18N:                String?
    
    /**
     * Sector according to CSU (codebook).
     */
    public internal(set) var sector:                              String?
    
    /**
     * Localized name of sector according to CSU.
     */
    public internal(set) var sectorI18N:                          String?
    
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.cnbType                 <- map["cnbType"]
        self.cnbTypeI18N             <- map["cnbTypeI18N"]
        self.industryCategory        <- map["industryCategory"]
        self.industryCategoryI18N    <- map["industryCategoryI18N"]
        self.sector                  <- map["sector"]
        self.sectorI18N              <- map["sectorI18N"]
        
        super.mapping( map )
    }
    
}
