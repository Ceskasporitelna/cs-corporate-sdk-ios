//
//  PaginatedListParameters.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 15/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import Foundation
import CSCoreSDK

//==============================================================================
public class PaginatedListParameters : Parameters, Paginated
{
    public var pagination : Pagination?
    
    public init(pagination: Pagination?)
    {
        self.pagination = pagination
        super.init()
    }
    
}
