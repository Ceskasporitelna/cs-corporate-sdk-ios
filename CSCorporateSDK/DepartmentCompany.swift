//
//  DepartmentCompany.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class DepartmentCompany: WebApiEntity
{
    /**
     * Company code.
     */
    public internal(set) var companyCode:                         String?
    
    /**
     * Company name.
     */
    public internal(set) var nameI18N:                            String?
    
    /**
     * Company display code.
     */
    public internal(set) var displayCode:                         String?
    
    /**
     * Company name in English
     */
    public internal(set) var nameI18NEn:                          String?
    
    /**
     * Department prefix
     */
    public internal(set) var departmentPrefix:                    Int?
    
    /**
     * Manually updated flag
     */
    public internal(set) var manuallyUpdated:                     Bool?
    
    /**
     * Department exists flag
     */
    public internal(set) var departmentExists:                    Bool?

    
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
        self.companyCode                      <- map["companyCode"]
        self.nameI18N                         <- map["nameI18N"]
        self.displayCode                      <- map["displayCode"]
        self.nameI18NEn                       <- map["nameI18N_EN"]
        self.departmentPrefix                 <- map["departmentPrefix"]
        self.manuallyUpdated                  <- map["manuallyUpdated"]
        self.departmentExists                 <- map["departmentExists"]
        
        super.mapping( map )
    }
    
}
