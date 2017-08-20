//
//  Contact.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 22/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Contact: WebApiEntity
{
    /**
     * Email of the employee.
     */
    public internal(set) var email:                               String?
    
    /**
     * Phone 1 number.
     */
    public internal(set) var phone1:                              String?
    
    /**
     * Phone 2 number.
     */
    public internal(set) var phone2:                              String?
    
    /**
     * Fax number.
     */
    public internal(set) var fax:                                 String?
    
    /**
     * Mobile number.
     */
    public internal(set) var mobil:                               String?
    
    /**
     * Office number.
     */
    public internal(set) var officeNumber:                        String?
    
    /**
     * Building.
     */
    public internal(set) var building:                            Building?
    
    /**
     * The employee login name.
     */
    public internal(set) var loginName:                           String?
    
    /**
     * The employee cost unit.
     */
    public internal(set) var costUnit:                            UInt64?
    
    /**
     * The employee cost unit.
     */
    public internal(set) var locationUnit:                        String?

    
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
        self.email                            <- map["email"]
        self.phone1                           <- map["phone1"]
        self.phone2                           <- map["phone2"]
        self.fax                              <- map["fax"]
        self.mobil                            <- map["mobil"]
        self.officeNumber                     <- map["officeNumber"]
        self.building                         <- map["building"]
        self.loginName                        <- map["loginName"]
        self.costUnit                         <- (map["costUnit"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        self.locationUnit                     <- map["locationUnit"]
        
        super.mapping( map )
    }
    
}
