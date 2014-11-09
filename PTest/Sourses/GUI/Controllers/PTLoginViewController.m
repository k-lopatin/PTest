//
//  PTLoginViewController.m
//  PTest
//
//  Created by Константин on 05.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import "PTLoginViewController.h"
#import "PTAppDelegate.h"

#import "PTFacebookManager.h"
#import "PTGooglePManager.h"
#import "PTVkManager.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

#define GPP_CLIENT_ID @"437683090487-io1mgi243srfg0ukl7gf3oonvho74a5b.apps.googleusercontent.com"
#define VK_CLIENT_ID @"4622046"

@interface PTLoginViewController ()

@end

@implementation PTLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setFacebookLoginDelegate];
    [self setGooglePlusLoginDelegate];
    [self setVKDelegate];


    // Do any additional setup after loading the view.
}

- (void) setFacebookLoginDelegate
{
    self.facebookManager = [[PTFacebookManager alloc] init];
    self.facebookLoginButton.delegate = self.facebookManager;
    self.facebookLoginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
}
- (void) setGooglePlusLoginDelegate
{
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.clientID = GPP_CLIENT_ID;
    signIn.shouldFetchGoogleUserEmail = YES;
    
    signIn.scopes = [NSArray arrayWithObjects:
                     kGTLAuthScopePlusLogin,
                     nil];
    
    self.googleManager = [[PTGooglePManager alloc] init];
    signIn.delegate = self.googleManager;
}

- (void) setVKDelegate
{
    self.vkManager = [[PTVkManager alloc] init];
    [VKSdk initializeWithDelegate:self.vkManager andAppId:VK_CLIENT_ID];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)gpSignInButtonClicked:(id)sender {
}
- (IBAction)signOutButtonClicked:(id)sender {
     [[GPPSignIn sharedInstance] signOut];
}

- (IBAction)vkSignInButtonClicked:(id)sender {
    [VKSdk authorize:@[@"friends"]];
}
@end
