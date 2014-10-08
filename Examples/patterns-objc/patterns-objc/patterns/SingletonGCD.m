//
//  SingletonGCD.m
//  patterns-objc
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

#import "SingletonGCD.h"

@implementation SingletonGCD

@synthesize myProp;


#pragma mark Singleton

+(id) getSingleton {
    
    static SingletonGCD *sharedSingleton = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once( &onceToken, ^{
        sharedSingleton = [[self alloc] init];
    });
    
    return sharedSingleton;
}

- (id) init {
    if ( self = [super init]) {
        myProp = @" My Property";
        //myProp = [[NSString alloc] initWithString:@" My Property"];
    }
    return self;
}

- ( void ) dealloc {
    // this will never be called, its a Singleton :)
}
@end
