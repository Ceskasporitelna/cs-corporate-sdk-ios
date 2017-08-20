//
//  AccountOwnerPerson.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 16/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class AccountOwnerPerson: WebApiEntity
{
    /**
     * First name of a person.
     */
    public internal(set) var firstName:                           String!
    
    /**
     * Last name of a person.
     */
    public internal(set) var lastName:                            String!
    
    /**
     * Title of a person.
     */
    public internal(set) var title:                               String?
    
    /**
     * Additional title of a person.
     */
    public internal(set) var additionalTitle:                     String?
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.firstName = String()
        self.lastName  = String()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.firstName             <- map["firstName"]
        self.lastName              <- map["lastName"]
        self.title                 <- map["title"]
        self.additionalTitle       <- map["additionalTitle"]
        
        super.mapping( map )
    }
    
}
