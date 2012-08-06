//
//  UIAlertView+DHUserData.m
//  UIAlertView+DHUserData
//
//  Created by Daniel Höpfl on 02.08.2012.
//  Copyright (c) 2012 Daniel Höpfl. All rights reserved.
//

#import "UIAlertView+DHUserData.h"
#import <objc/runtime.h>

static const void *DHUIAlertViewDHUserDataObjectKey = "dhUserData";

@implementation UIAlertView (DHUserData)

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

@end
