//
//  SingletonOne.h
//  patterns-objc
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonSimpleARC : NSObject {
    NSString *someProperty;
}

@property ( nonatomic, retain ) NSString *someProperty;

+ (id) getSingleton;

@end
