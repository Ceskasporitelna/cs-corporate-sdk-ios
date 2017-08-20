//
//  Employee.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 30/06/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class Employee: WebApiEntity
{
    /**
     * The Employee id, used in API-s like PhoneBook.
     */
    public internal(set) var empId:                               UInt64!
    
    /**
     * Convenience property for relationship manager photo resource
     */
    public var relationshipManagerPhotoResource: RelationshipManagerPhotoResource {
        return (self.resource as! RelationshipManagerResource).photo
    }
    
    /**
     * Convenience method for getting detail of the relationship manager from the list
     */
    //--------------------------------------------------------------------------
    func relationshipManager(_ callback: @escaping (_ result: CoreResult<EmployeeDetail>) -> Void)
    {
        (self.resource as! RelationshipManagerResource).get(callback)
    }
    
    //--------------------------------------------------------------------------
    public override init()
    {
        super.init()
        self.empId                            = UInt64()
    }
    
    //--------------------------------------------------------------------------
    public required init?(_ map: Map)
    {
        super.init(map)
    }
    
    //--------------------------------------------------------------------------
    public override func mapping(_ map: Map)
    {
        self.empId                            <- (map["empId"], TransformOf<UInt64, NSNumber>(fromJSON: { $0?.uint64Value }, toJSON: { $0.map { NSNumber(value: $0) } }))
        
        super.mapping( map )
    }

    

}
