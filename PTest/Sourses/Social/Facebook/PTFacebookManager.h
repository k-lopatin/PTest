//
//  PTFacebookManager.h
//  PTest
//
//  Created by Константин on 05.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface PTFacebookManager : NSObject

- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error;
- (void)userLoggedIn;
- (void)userLoggedOut;

@end
