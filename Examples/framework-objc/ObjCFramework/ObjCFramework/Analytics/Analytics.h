//
//  Analytics.h
//  ObjCFramework
//
//  Created by Matthew Schmulen on 10/30/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Analytics : NSObject

+ (instancetype)sharedAnalytics:(NSString *)name;

@end
