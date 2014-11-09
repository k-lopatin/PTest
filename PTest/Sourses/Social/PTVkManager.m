//
//  PT.m
//  PTest
//
//  Created by Константин on 09.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import "PTVkManager.h"
#import "VKUser.h"

@implementation PTVkManager

-(void) vkSdkReceivedNewToken:(VKAccessToken*) newToken
{
    VKRequest *audioReq = [[VKApi friends] get];
    
    [audioReq executeWithResultBlock:^(VKResponse * response) {
        NSLog(@"Json result: %@", response.json);
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        }
        else {
            NSLog(@"VK error: %@", error);
        }
    }];
}

-(void) vkSdkUserDeniedAccess:(VKError*) authorizationError
{}

-(void) vkSdkNeedCaptchaEnter:(VKError *)captchaError
{}

-(void) vkSdkTokenHasExpired:(VKAccessToken *)expiredToken
{}

-(void) vkSdkShouldPresentViewController:(UIViewController *)controller
{}

@end
