# AppVersionMonitor

[![CI Status](http://img.shields.io/travis/muukii/AppVersionMonitor.svg?style=flat)](https://travis-ci.org/muukii/AppVersionMonitor)
[![Version](https://img.shields.io/cocoapods/v/AppVersionMonitor.svg?style=flat)](http://cocoapods.org/pods/AppVersionMonitor)
[![License](https://img.shields.io/cocoapods/l/AppVersionMonitor.svg?style=flat)](http://cocoapods.org/pods/AppVersionMonitor)
[![Platform](https://img.shields.io/cocoapods/p/AppVersionMonitor.svg?style=flat)](http://cocoapods.org/pods/AppVersionMonitor)

**Monitor iOS app version easily.**

You can get previous version and installation history.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS8.0 +
- [Semantic Versioning](http://semver.org/)

## Installation

AppVersionMonitor is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AppVersionMonitor"
```

## Usage

#### Setup

```swift

// AppDelegate

func applicationDidFinishLaunching(application: UIApplication) {

    AppVersionMonitor.sharedMonitor.startup()
}

```

#### Get MarketingVersion (CFBundleShortVersionString)
```
let currentVersion: AppVersion = AppVersion.marketingVersion
let versionString: String = AppVersion.marketingVersion.versionString // "1.2.3"
```

#### Get installed version

```swift
let installedVersions: [AppVersion] = AppVersionMonitor.sharedMonitor.installedVersions
```

#### Compare Version

```swift
AppVersion.marketingVersion > AppVersion("1.2.3")
AppVersion("1.2.3") < AppVersion("3.2.1")
AppVersion("1.2.3") < "3.2.1"
```

#### You can check app version status easily.
```swift
switch AppVersionMonitor.sharedMonitor.state {
case .Installed:

// Do something when app installed.
// Happy! 🍻
// ex. Start tutorial.

case .NotChanged:

// Do something when version not changed.
// Peace 😌
// Nothing to do?

case .Upgraded(let previousVersion: AppVersion):

// Do something when version upgraded.
// Yeah! 😝
// ex. Migrate App Data.

case .Downgraded(let previousVersion: AppVersion):

// Do something when version downgraded. (Impossible normally)
// What happened? 😵
// ex. Purge App Data.

}
```

## Author

muukii <m@muukii.me>

## License

AppVersionMonitor is available under the MIT license. See the LICENSE file for more info.
