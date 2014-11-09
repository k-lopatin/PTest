//
//  PTGooglePManager.m
//  PTest
//
//  Created by Константин on 09.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import "PTGooglePManager.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

@implementation PTGooglePManager

- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error
{
    if(!error) {
        GPPSignIn *signIn = [GPPSignIn sharedInstance];
        NSLog(@"%@", signIn.authentication.userEmail);
        NSLog(@"test");
    }
    
    NSLog(@"Received error %@ and auth object %@",error, auth);
}

- (void)disconnect {
    [[GPPSignIn sharedInstance] disconnect];
}

- (void)didDisconnectWithError:(NSError *)error {
    if (error) {
        NSLog(@"Received error %@", error);
    } else {
    }
}

@end
