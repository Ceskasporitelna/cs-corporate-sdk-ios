//
//  EmployeeDetail.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class EmployeeDetail: Employee
{
    /**
     * Employee personal number.
     */
    public internal(set) var personalNumber:                      String?
    
    /**
     * Employee manager identifier.
     */
    public internal(set) var employeeManagerId:                   UInt64?
    
    /**
     * Title.
     */
    public internal(set) var titleA:                              String?
    
    /**
     * Title.
     */
    public internal(set) var titleB:                              String?
    
    /**
     * First name.
     */
    public internal(set) var name:                                String?
    
    /**
     * Surname.
     */
    public internal(set) var surname:                             String?
    
    /**
     * Full name composite.
     */
    public internal(set) var fullName:                            String?
    
    /**
     * Enumeration: MALE/FEMALE.
     */
    public internal(set) var gender:                              GenderType?
    
    /**
     * Contact info
     */
    public internal(set) var contact:                             Contact?
    
    /**
     * Department info
     */
    public internal(set) var department:                          Department?
    
    /**
     * Employee position info.
     */
    public internal(set) var position:                            Position?
    
    /**
     * Code of a segment of the employee.
     */
    public internal(set) var segment:                             String?
    
    /**
     * Code of the employee team.
     */
    public internal(set) var teamId:                              String?
    
    /**
     * Set to true, when employee is a manager.
     */
    public internal(set) var isManager:                           Bool?
    
    /**
     * Set to true, when employee is blocked.
     */
    public internal(set) var isBlocked:                           Bool!

    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.isBlocked = Bool()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.personalNumber                   <- map["personalNumber"]
        self.employeeManagerId                <- (map["employeeManagerId"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.titleA                           <- map["titleA"]
        self.titleB                           <- map["titleB"]
        self.name                             <- map["name"]
        self.surname                          <- map["surname"]
        self.fullName                         <- map["fullName"]
        self.gender                           <- (map["gender"], GenderType.transform())
        self.contact                          <- map["contact"]
        self.department                       <- map["department"]
        self.position                         <- map["position"]
        self.segment                          <- map["segment"]
        self.teamId                           <- map["teamId"]
        self.isManager                        <- map["isManager"]
        self.isBlocked                        <- map["isBlocked"]
        
        super.mapping( map )
    }
    
}
