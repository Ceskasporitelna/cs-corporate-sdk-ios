//
//  AccountsParameters.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation
import CSCoreSDK

// MARK: - Field
//==============================================================================
public enum AccountsSortableFields : HasFieldName
{
    /**
     * ID sort field.
     */
    case id
    
    /**
     * Sort by other field.
     */
    case other(value : String)
    
    //--------------------------------------------------------------------------
    public var fieldName: String {
        switch ( self ) {
        case .id:
            return "id"
        case .other(let value):
            return value
        }
    }
}

//==============================================================================
public class AccountsParameters: PaginatedListParameters, Sortable
{
    public var sortBy : Sort<AccountsSortableFields>?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination?, sort: Sort<AccountsSortableFields>? = nil)
    {
        super.init(pagination:pagination)
        self.sortBy = sort
    }
    
    //--------------------------------------------------------------------------
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params = super.toDictionary(existingParams)
        if let sortBy = self.sortBy {
            params = sortBy.addSortParams(params)
        }
        return params
    }
}
