# Impact Raidus Event Tracker Demo App for iOS #

This demo app gives some examples of using the [Event Tracker library](https://github.com/...) to track events on iOS devices, and it also shows how to install the lib using cocoapods.

It comes with the **project.pbxproj** file, which makes it easy to build and run the app. In order to successfully post data, you will have to change the following line in **irAppDelegate.m**, to feed in your tracker id (namely the app id)  and credentials given by Impact Radius.

```objective-c
[tracker initializeWithAppId:@"YOUR APP ID"
                  accountSID:@"YOUR AUTHORIZATION TOKEN"
                  authorizationToken:@"YOUR ACCOUNT SID"];
```

For a detailed tutorial of the Event Tracker lib, please see [here](https://github.com/...).