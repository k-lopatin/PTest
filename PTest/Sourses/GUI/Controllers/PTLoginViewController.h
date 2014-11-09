//
//  PTLoginViewController.h
//  PTest
//
//  Created by Константин on 05.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <GooglePlus/GooglePlus.h>
#import <VK-ios-sdk/VKSdk.h>

@class PTVkManager;
@class PTGooglePManager;
@class PTFacebookManager;

@interface PTLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet FBLoginView *facebookLoginButton;
@property (weak, nonatomic) IBOutlet GPPSignInButton *gppSignInButton;

- (IBAction)signOutButtonClicked:(id)sender;

- (IBAction)vkSignInButtonClicked:(id)sender;

//social managers delegates
@property (strong, nonatomic) PTFacebookManager *facebookManager;
@property (strong, nonatomic) PTGooglePManager *googleManager;
@property (strong, nonatomic) PTVkManager *vkManager;

@end
