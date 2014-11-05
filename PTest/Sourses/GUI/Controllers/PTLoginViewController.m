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
    self.facebookLoginButton.delegate = self;
    
    
    
//    FBLoginView *loginView = [[FBLoginView alloc] init];
//    [self.view addSubview:loginView];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
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

@end
