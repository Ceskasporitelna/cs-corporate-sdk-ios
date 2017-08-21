# Companies

This guide walks you through retrieving list of companies associated with a logged-in user.

[CompaniesResource](../CSCorporateSDK/CompaniesResource.swift)

```swift

    // Get CompaniesResource Instance
    let companiesResource = corporateClient.companies
    
```

## 1. List companies

List companies by getting the [CompaniesResource](../CSCorporateSDK/CompaniesResource.swift)and then calling the `list` method. For full response see [Company](../CSCorporateSDK/Company.swift).

```swift

    // List of companies
    corporateClient.companies
        .list({
            companies in
            //Do something with companies
        });

```

## 2. Get company

Get company by getting the [CompanyResource](../CSCorporateSDK/CompanyResource.swift) and then calling the `get` method. For complete response see [Company](../CSCorporateSDK/Company.swift)

```swift

    // Get company
    corporateClient.companies
        .withId(id)
        .get({
            company in 
            //Do something with company
        });

```

## 3. List all company campaigns

You can list all of single company campaigns by calling the `list` method on [CampaignsResource](../CSCorporateSDK/CampaignsResource.swift). For full response see [Campaign](../CSCorporateSDK/Campaign.swift)

```swift

    // List company campaigns
    corporateClient.companies
        .withId(id)
        .campaigns
        .list({
            campaigns in
            //Do something with campaigns
        });

```

## 4. List all company relationship managers

You can list all of single company relationship managers by calling the `list` method on [RelationshipManagersResource](../CSCorporateSDK/RelationshipManagersResource.swift). The method takes object with properties as a parameter. See all parameters in [RelationshipManagersParameters](../CSCorporateSDK/RelationshipManagersParameters.swift).

```swift

    // List all relationship managers grouped by their positions
    corporateClient.companies
        .withId(id)
        .relationshipManagers
        .list(relationshipManagersParameters, callback: {
            relationshipManagers in
            //Do something with relationshipManagers
        });

```

## 5. Get relationship manager detail

Get single relationship manager by getting the [RelationshipManagerResource](../CSCorporateSDK/RelationshipManagerResource.swift) and then calling the `get` method. For complete response see [EmployeeDetail](../CSCorporateSDK/EmployeeDetail.swift)

```swift

    // List all relationship managers grouped by their positions
    corporateClient.companies
        .withId(id)
        .relationshipManagers
        .withId(id)
        .get({
            relationshipManager in
            //Do something with relationshipManager
        });

```

## 6. Download relationship manager photo

Download relationship manager photo by getting the [RelationshipManagerPhotoResource](../CSCorporateSDK/RelationshipManagerPhotoResource.swift) and then calling the `download` method. The method takes object with properties as a parameter. See all parameters in [RelationshipManagerPhotoParameters](../CSCorporateSDK/RelationshipManagerPhotoParameters.swift).

```swift

    // Download photo of the relationship manager 
    corporateClient.companies
        .withId(id)
        .relationshipManagers
        .withId(id)
        .photo
        .download(relationshipManagerPhotoParameters, callback:{
            photo: CoreResult<String> in
            //Do something with downloaded photo
        });

```

## 7. Get info about relationship manager photo

Get info about relationship manager photo by getting the [RelationshipManagerPhotoInfoResource](../CSCorporateSDK/RelationshipManagerPhotoInfoResource.swift) and then calling the `get` method. For complete response see [RelationshipManagerPhotoInfo](../CSCorporateSDK/RelationshipManagerPhotoInfo.swift)

```swift

    // Get relationship manager photo info
    corporateClient.companies
        .withId(id)
        .relationshipManagers
        .withId(id)
        .photo
        .info
        .get({
            photoInfo in
            //Do something with downloaded photo info
        });
            
```


