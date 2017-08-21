# Using CorporateSDK

Corporate provides access to certain data the Erste Bank provides for its corporate clients (as opposed to retail clients, it means API-s are available both for SME and corporate segments). The bank values clients' trust and privacy, data provided in this API are available solely to authenticated user that is reliably related to Erste bank client. Such a relation is established either in Business24 internetbanking or via internal mechanisms of the bank. Each client is only provided information that relates to her or him personally (e.g. contact data) or companies she or he is related to, i.e. no such information can be retrived by any third party via this API.

## Before You Begin

Before using CoreSDK in your application, you need to initialize it by providing it your WebApiKey.

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        CoreSDK.sharedInstance
            .useWebApiKey("YourApiKey")
            .useEnvironment(Environment.Sandbox)
        //Now you are ready to obtain the Corporate client
        let client = Corporate.sharedInstance.client;
        return true
    }
```

For more configuration options see **[CoreSDK configuration guide](https://github.com/Ceskasporitelna/cs-core-sdk-ios/blob/master/docs/configuration.md)**


### Authentication
Before making any calls through Corporate SDK, you need to obtain an valid access token for the user of your application.

#### With Locker (preferred method)

Locker is CoreSDK tool which simplifies authentication against CSAS servers. Make sure to go through CoreSDK and Locker configuration settings (see above) in a case of using this authentication method. 

```swift


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
            CoreSDK.sharedInstance
                .useWebApiKey("YourApiKey")
                .useEnvironment(Environment.Sandbox)
                // IMPORTANT!
                // Let CoreSDK know that u use Locker and pass configuration object. 
                 //
                .useLocker(
                    clientId: "YourClientID",
                    clientSecret: "YourClientSecret",
                    publicKey: "YourPublicKey",
                    redirectUrlPath: "yourscheme://your-path",
                    scope: "/v1/corporate")

             return true
        }

```

When the locker is in **unlocked** state, the access token will be automatically passed to the Corporate SDK. Refresh of the token will also be done automatically for you.

#### Without Locker

Locker is not the only option how to handle the authentication process. It is possible to pass your own access token provider. See the code snippet below.

```swift

    // Create custom access token provider
    public class CustomAccessTokenProvider: AccessTokenProvider
    {
        public accessToken(callback: ((CoreResult<AccessToken>) -> Void))
        {
            // implement your retrieving access token
        }
        
        public refreshAccessToken(callback: ((CoreResult<AccessToken>) -> Void))
        {
            // implement your refreshing access token
        }
    }

    // Set custom access token provider 
    corporateClient.accessTokenProvider = CustomAccessTokenProvider()

```


## Functionality

Corporate SDK provides the following functionality:

- [**Accounts**](./accounts.md) - Accounts allows user to get information about relevant bank accounts. It allows to get list of bank accounts with information about their owner (company) with recent transaction history. API is usable only for users that have passive disposition rights to at least one bank account belonging to any of his/her related companies.
- [**Companies**](./companies.md) - Companies resource allows getting list of companies associated with a logged-in user.

## General concepts

### Pagination

Resources that supports pagination implement `PaginatedListEnabled` protocol (for example [`AccountsResource`](../CSCorporateSDK/AccountsResource.swift)). If thats the case you can (and should) pass the corresponding object with properties `pageNumber` and `pageSize` to the `list` method. There is no SDK default pagination so if you do not pass pagination parameters then you get whatever the server decides so we strongly recommend you use pagination parameters.

```swift
let pagination = Pagination(pageNumber: 0, // number of the page
                                    pageSize: 20) // number of items on each page
    let params = AccountsParameters(pagination: pagination, sortBy: nil)

    corporateClient.accounts.list(params){ result in
        switch result{
        case .Success(let response):
            response.pagination.hasNextPage // is more pages available
            response.pagination.pageCount  // number of pages available
            response.pagination.pageNumber // actual number of the page
            response.pagination.pageSize   // number of items on each page

        case .Failure(let error):
            print(error.localizedDescription)
        }
    }
```

### Sorting

Objects that support server side sorting have an array of tupples (`sort`,`order`) as a parameter. These objects' parameter implement [`Sortable`](https://github.com/Ceskasporitelna/cs-core-sdk-ios/blob/master/CoreSDK/Sortable.swift) protocol.

- `sort` we recommend use Enum implementing protocol [`AccountsSortableFields`](../CSCorporateSDK/AccountsParameters.swift) or you can String.
- `order` is and Enum [`SortDirection`](https://github.com/Ceskasporitelna/cs-core-sdk-ios/blob/master/CoreSDK/Sortable.swift).

```swift
let sortBy = Sort(by: [(AccountsSortableFields.id,  // sorty by id
                               SortDirection.Ascending),  // Ascending
                               (AccountsSortableFields.other(value: "customField") // sort by custom field,
                               SortDirection.descending)]) // Descending
    let params =  AccountsParameters(pagination: nil, sort: sortBy)

     corporateClient.accounts.list(params){ result in
        switch result{
        case .Success(let response):
           for account in response.items { // places sorted by preferences..
           //
           }
        case .Failure(let error):
            print(error.localizedDescription)
        }
    }
```

**Note:** Many resources (i.e. `AccountsResource`) support both Pagination and Sorting.

## Demo

Check out the [demo application](https://github.com/Ceskasporitelna/csas-sdk-demo-ios) for usage demonstration.

## Further documentation

You can look into the source code of this repository to see documented classes and methods of this SDK.

This SDK communicates with Corporate API. You can have a look at its [documentation](http://docs.ext1csascorporates.apiary.io/#reference).