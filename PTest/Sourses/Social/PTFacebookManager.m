//
//  PTFacebookManager.m
//  PTest
//
//  Created by Константин on 06.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import "PTFacebookManager.h"

@implementation PTFacebookManager

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    NSLog(@"test");
    [self getFriendsList];
}

- (void) getFriendsList
{
    FBRequest* friendsRequest = [FBRequest requestForMyFriends];
    [friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection,
            NSDictionary* result,
            NSError *error) {
        NSArray* friends = [result objectForKey:@"data"];
        NSLog(@"Found: %i friends", friends.count);
        for (NSDictionary<FBGraphUser>* friend in friends) {
            NSLog(@"I have a friend named %@", friend.name);
        }
    }];
}


@end
