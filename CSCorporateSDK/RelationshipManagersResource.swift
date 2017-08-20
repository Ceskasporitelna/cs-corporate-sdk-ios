//
//  RelationshipManagersResource.swift
//  CSCorporateSDK
//
//  Created by Vladimír Nevyhoštěný on 20/01/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import CSCoreSDK

//==============================================================================
public class RelationshipManagersResource: Resource, ParametrizedListEnabled, HasInstanceResource
{
    /**
     * List all relationship managers grouped by their positions. You will get 
     * an array of positions whilst each position may include one or more relationship managers. 
     * Typically there should be just one position flagged as primary as well as one contact in each position.
     * You can filter for all positions (ALL) or for primary only (PRIMARY).
     */
    //--------------------------------------------------------------------------
    public func list(_ params: RelationshipManagersParameters, callback: @escaping (_ result: CoreResult<ListResponse<RelationshipManager>>) -> Void)
    {
        ResourceUtils.CallList(self, parameters: params.toDictionary(nil), transform: nil, callback: callback)
    }
    
    /**
     * Returns RelationshipManagerResource for a given employee id
     */
    //--------------------------------------------------------------------------
    public func withId(_ id: Any) -> RelationshipManagerResource
    {
        return RelationshipManagerResource(id: id, path: self.path, client: self.client);
    }
}
