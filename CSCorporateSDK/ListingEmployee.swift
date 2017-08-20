//
//  ListingEmployee.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 21/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class ListingEmployee: Employee
{
    /**
     * Specialist's first name.
     */
    public internal(set) var firstName:                           String!
    
    /**
     * Specialist's last name.
     */
    public internal(set) var lastName:                            String!
    
    /**
     * Marks a specialist as primary for a client.     
     */
    public internal(set) var primaryFlag:                         Bool?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        
        self.empId                           = UInt64()
        self.firstName                       = String()
        self.lastName                        = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.firstName                        <- map["firstName"]
        self.lastName                         <- map["lastName"]
        self.primaryFlag                      <- map["primaryFlag"]
        
        super.mapping( map )
    }
    
}
