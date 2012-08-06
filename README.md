# UserData for UIAlertView

Wouldn’t it be nice if one could add a custom object to every `UIAlertView` instance? With this tiny category, you can!

## Usage

Import the `UIAlertView+DHUserData`-Headerfile:

```
#import "UIAlertView+DHUserData.h"
```

In your code, simply use the `dhUserData` property to assign your custom data:

```
UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Customized"
                                                    message:@"This alert has custom data"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Wow", @"Shocking" nil];
alertView.dhUserData = @{
   @"believable" : @NO,
   @"funfactor" : @"high"
};
```
In `UIAlertView`’s callback, your data is still there:

```
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   NSLog(@"Believable: %@", [alertView.dhUserData objectForKey:@"believabe"]);
}
```

## Implementation

`UIAlertView+DHUserData` uses associated data provided by the Objective-C runtime to store the user data. The getter/setter simply forward the calls to the matching Objective-C runtime calls:

```
- (void)setDhUserData:(id)dhUserData
{
    objc_setAssociatedObject(self,
                             DHUIAlertViewDHUserDataObjectKey,
                             dhUserData,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)dhUserData
{
    return objc_getAssociatedObject(self,
                                    DHUIAlertViewDHUserDataObjectKey);
}
```

