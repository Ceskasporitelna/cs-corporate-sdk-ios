# CSCorporate SDK

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This SDK provides access to certain data the Erste Bank provides for its corporate clients. [Corporate API](http://

# [CHANGELOG](CHANGELOG.md)

# Requirements

- iOS 8.1+
- Xcode 8.3+

# CSCorporateSDK Installation

## Install through Carthage

If you use [Carthage](https://github.com/Carthage/Carthage) you can add a dependency on CSCorporateSDK by adding it to your Cartfile:

```
github 'Ceskasporitelna/cs-corporate-sdk-ios'
```

## Install through CocoaPods

You can install CSCorporateSDK by adding the following line into your Podfile:

```ruby
#Add Ceska sporitelna pods specs respository
source 'https://github.com/Ceskasporitelna/cocoa-pods-specs.git'
source 'https://github.com/CocoaPods/Specs.git'

# Include mandatory CSCoreSDK
pod 'CSCoreSDK'

pod 'CSCorporateSDK'
```

# Usage

After you've installed the SDK using Carthage or CocoaPods You can simply import the module wherever you wish to use it:

```swift
import CSCorporateSDK
```

## Configuration

You have to configure and initialize CSCoreSDK before using CSCorporate SDK.

You can find example of CoreSDK configuration below:

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

## Usage guide

**See [Usage Guide](./docs/corporate.md)** for usage instructions.

**TIP!** - You can also learn Corporate SDK by example in our [**demo**](https://github.com/Ceskasporitelna/csas-sdk-demo-ios)!

# Contributing

Contributions are more than welcome!

Please read our [contribution guide](CONTRIBUTING.md) to learn how to contribute to this project.

# Terms and License

Please read our [terms & conditions in license](LICENSE.md)
