# Using CorporateSDK

Corporate provides access to certain data the Erste Bank provides for its corporate client.

## Before You Begin

Before using CoreSDK in your application, you need to initialize it by providing it your WebApiKey.

```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        CoreSDK.sharedInstance
            .useWebApiKey("YourApiKey")
            .useEnvironment(Environment.Sandbox)
        //Now you are ready to obtain the TransparentAcc client
        let client = TransparentAcc.sharedInstance.client;
        return true
    }
```

## Resources