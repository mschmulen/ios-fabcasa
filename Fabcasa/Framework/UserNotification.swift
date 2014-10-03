//
//  UserNotification.swift
//  fabcasa
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import Foundation

//Reference: https://nrj.io/simple-interactive-notifications-in-ios-8?utm_campaign=This_Week_in_Swift_11&utm_medium=email&utm_source=This%2BWeek%2Bin%2BSwift

class UserNotification {
    
    //NSString * const NotificationCategoryIdent  = @"ACTIONABLE";
    //NSString * const NotificationActionOneIdent = @"ACTION_ONE";
    //NSString * const NotificationActionTwoIdent = @"ACTION_TWO";
    
    //application:handleActionWithIdentifier:forLocalNotification:completionHandler:
    //application:handleActionWithIdentifier:forRemoteNotification:completionHandler:
    
    func registerForNotification() {
    
        /*
    UIMutableUserNotificationAction *action1;
    action1 = [[UIMutableUserNotificationAction alloc] init];
    [action1 setActivationMode:UIUserNotificationActivationModeBackground];
    [action1 setTitle:@"Action 1"];
    [action1 setIdentifier:NotificationActionOneIdent];
    [action1 setDestructive:NO];
    [action1 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationAction *action2;
    action2 = [[UIMutableUserNotificationAction alloc] init];
    [action2 setActivationMode:UIUserNotificationActivationModeBackground];
    [action2 setTitle:@"Action 2"];
    [action2 setIdentifier:NotificationActionTwoIdent];
    [action2 setDestructive:NO];
    [action2 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationCategory *actionCategory;
    actionCategory = [[UIMutableUserNotificationCategory alloc] init];
    [actionCategory setIdentifier:NotificationCategoryIdent];
    [actionCategory setActions:@[action1, action2]
    forContext:UIUserNotificationActionContextDefault];
    
    NSSet *categories = [NSSet setWithObject:actionCategory];
    UIUserNotificationType types = (UIUserNotificationTypeAlert|
    UIUserNotificationTypeSound|
    UIUserNotificationTypeBadge);
    
    UIUserNotificationSettings *settings;
    settings = [UIUserNotificationSettings settingsForTypes:types
    categories:categories];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
*/
    }
    
}

