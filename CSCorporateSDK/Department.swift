//
//  Department.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Department: WebApiEntity
{
    /**
     * Department ID
     */
    public internal(set) var id:                                  UInt64!
    
    /**
     * Department code.
     */
    public internal(set) var departmentCode:                      String?
    
    /**
     * Localized department name.
     */
    public internal(set) var nameI18N:                            String?
    
    /**
     * Department head ID
     */
    public internal(set) var headId:                              UInt64?
    
    /**
     * Department parent ID
     */
    public internal(set) var parentId:                            UInt64?
    
    /**
     * Department parent ID
     */
    public internal(set) var company:                             DepartmentCompany?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.id    = UInt64()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.id                               <- (map["id"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.departmentCode                   <- map["departmentCode"]
        self.nameI18N                         <- map["nameI18N"]
        self.headId                           <- (map["headId"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.parentId                         <- (map["parentId"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.company                          <- map["company"]
        
        super.mapping( map )
    }
    
}
