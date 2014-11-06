//
//  PTFacebookDelegate.m
//  PTest
//
//  Created by Константин on 06.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import "PTFacebookDelegate.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation PTFacebookDelegate

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    NSLog(@"test");
}

@end
