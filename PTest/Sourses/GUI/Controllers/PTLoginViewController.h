//
//  PTLoginViewController.h
//  PTest
//
//  Created by Константин on 05.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface PTLoginViewController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *facebookLoginButton;

@end
