//
//  TransactionsParameters.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 19/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation
import CSCoreSDK

// MARK: - Field
//==============================================================================
public enum TransactionsSortableFields : HasFieldName
{
    /**
     * Sort by other field.
     */
    case other(value : String)
    
    //--------------------------------------------------------------------------
    public var fieldName: String {
        switch ( self ) {
        case .other(let value):
            return value
        }
    }
}

//==============================================================================
public class TransactionsParameters: PaginatedListParameters, Sortable
{
    fileprivate var dateStart: Date?
    fileprivate var dateEnd:   Date?
    public      var sortBy:    Sort<TransactionsSortableFields>?
    
    //--------------------------------------------------------------------------
    public init(pagination:Pagination? = nil, dateStart: Date? = Date.distantPast, dateEnd: Date? = Date.distantFuture, sort: Sort<TransactionsSortableFields>? = nil)
    {
        super.init(pagination:pagination)
        
        self.dateStart = dateStart
        self.dateEnd   = dateEnd
        self.sortBy    = sort
    }
    
    //--------------------------------------------------------------------------
    public override func toDictionary(_ existingParams: [String : AnyObject]?) -> [String : AnyObject]
    {
        var params           = super.toDictionary(existingParams)
        
        let formatter        = DateFormatter()
        formatter.dateFormat = CSCorporateSDK.DateTimeFormat
        
        if let date = self.dateStart {
            params ["dateStart"] = formatter.string(from: date) as AnyObject?
        }
        if let date = self.dateEnd {
            params ["dateEnd"] = formatter.string(from: date) as AnyObject?
        }
        
        if let sortBy = self.sortBy {
            params = sortBy.addSortParams(params)
        }
        
        return params
    }
}
