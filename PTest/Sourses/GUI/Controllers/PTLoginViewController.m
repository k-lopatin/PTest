//
//  PTLoginViewController.m
//  PTest
//
//  Created by Константин on 05.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import "PTLoginViewController.h"
#import "PTAppDelegate.h"

//#import "PTFacebookDelegate.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

//#import "VKSdk.h"

#define GPP_CLIENT_ID @"437683090487-io1mgi243srfg0ukl7gf3oonvho74a5b.apps.googleusercontent.com"

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
    

    // Do any additional setup after loading the view.
}

- (void) setFacebookLoginDelegate
{
    //PTFacebookDelegate *facebookDelegate = [PTFacebookDelegate new];
    self.facebookLoginButton.delegate = self;
}
- (void) setGooglePlusLoginDelegate {
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    // Вы уже задали kClientID на этапе инициализации клиента Google+
    signIn.clientID = GPP_CLIENT_ID;
    signIn.shouldFetchGoogleUserEmail = YES;
    
    signIn.scopes = [NSArray arrayWithObjects:
                     kGTLAuthScopePlusLogin, // определяется в файле GTLPlusConstants.h
                     nil];
    signIn.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    NSLog(@"test");
}

#pragma mark google plus login
- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error
{
    if(!error) {
        // Получим адрес электронной почты.
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
        // Пользователь вышел и отключился.
        // Удалим данные пользователя в соответствии с Условиями использования Google+.
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)gpSignInButtonClicked:(id)sender {
}
- (IBAction)signOutButtonClicked:(id)sender {
     [[GPPSignIn sharedInstance] signOut];
}
@end
