//
//  PTFacebookManager.m
//  PTest
//
//  Created by Константин on 05.11.14.
//  Copyright (c) 2014 head-system. All rights reserved.
//

#import "PTFacebookManager.h"

@implementation PTFacebookManager

// This method will handle ALL the session state changes in the app
- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error
{
    // If the session was opened successfully
    if (!error && state == FBSessionStateOpen){
        NSLog(@"Session opened");
        // Show the user the logged-in UI
        [self userLoggedIn];
        return;
    }
    if (state == FBSessionStateClosed || state == FBSessionStateClosedLoginFailed){
        // If the session is closed
        NSLog(@"Session closed");
        // Show the user the logged-out UI
        [self userLoggedOut];
    }
    
    // Handle errors
    if (error){
        NSLog(@"Error");
        NSString *alertText;
        NSString *alertTitle;
        // If the error requires people using an app to make an action outside of the app in order to recover
        if ([FBErrorUtility shouldNotifyUserForError:error] == YES){
            alertTitle = @"Something went wrong";
            alertText = [FBErrorUtility userMessageForError:error];
            [self showMessage:alertText withTitle:alertTitle];
        } else {
            
            // If the user cancelled login, do nothing
            if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
                NSLog(@"User cancelled login");
                
                // Handle session closures that happen outside of the app
            } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
                alertTitle = @"Session Error";
                alertText = @"Your current session is no longer valid. Please log in again.";
                [self showMessage:alertText withTitle:alertTitle];
                
                // For simplicity, here we just show a generic message for all other errors
                // You can learn how to handle other errors using our guide: https://developers.facebook.com/docs/ios/errors
            } else {
                //Get more error information from the error
                NSDictionary *errorInformation = [[[error.userInfo objectForKey:@"com.facebook.sdk:ParsedJSONResponseKey"] objectForKey:@"body"] objectForKey:@"error"];
                
                // Show the user an error message
                alertTitle = @"Something went wrong";
                alertText = [NSString stringWithFormat:@"Please retry. \n\n If the problem persists contact us and mention this error code: %@", [errorInformation objectForKey:@"message"]];
                [self showMessage:alertText withTitle:alertTitle];
            }
        }
        // Clear this token
        [FBSession.activeSession closeAndClearTokenInformation];
        // Show the user the logged-out UI
        [self userLoggedOut];
    }
}

// Show the user the logged-out UI
- (void)userLoggedOut
{
    // Set the button title as "Log in with Facebook"
    //UIButton *loginButton = [self.customLoginViewController loginButton];
   // [loginButton setTitle:@"Log in with Facebook" forState:UIControlStateNormal];
    
    // Confirm logout message
    [self showMessage:@"You're now logged out" withTitle:@""];
}

// Show the user the logged-in UI
- (void)userLoggedIn
{
    // Set the button title as "Log out"
//    UIButton *loginButton = self.customLoginViewController.loginButton;
//    [loginButton setTitle:@"Log out" forState:UIControlStateNormal];
//    
    // Welcome message
    [self showMessage:@"You're now logged in" withTitle:@"Welcome!"];
    
}

// Show an alert message
- (void)showMessage:(NSString *)text withTitle:(NSString *)title
{
    [[[UIAlertView alloc] initWithTitle:title
                                message:text
                               delegate:self
                      cancelButtonTitle:@"OK!"
                      otherButtonTitles:nil] show];
}

// During the Facebook login flow, your app passes control to the Facebook iOS app or Facebook in a mobile browser.
// After authentication, your app will be called back with the session information.
// Override application:openURL:sourceApplication:annotation to call the FBsession object that handles the incoming URL
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBSession.activeSession handleOpenURL:url];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    // Handle the user leaving the app while the Facebook login dialog is being shown
    // For example: when the user presses the iOS "home" button while the login dialog is active
    [FBAppCall handleDidBecomeActive];
}

@end
