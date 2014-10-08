//
//  SingletonNoArc.m
//  patterns-objc
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

#import "SingletonNoARC.h"

static SingletonNoARC *mySingleton = nil;

@implementation SingletonNoARC

@synthesize myProp;

#pragma mark Singleton Methods

+ (id)getSingleton {
    @synchronized(self) {
        if(mySingleton == nil)
            mySingleton = [[super allocWithZone:NULL] init];
    }
    return mySingleton;
}

- (id)init {
    if (self = [super init]) {
        myProp = @"YACK YACK YACK";
    }
    return self;
}

/*
 - (void)dealloc {
 // Should never be called .. its a singleton
 [myProp release];
 [super dealloc];
 }
 
+ (id)allocWithZone:(NSZone *)zone {
    return [[self mySingleton] retain];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}

- (oneway void)release {
    // never release
}

- (id)autorelease {
    return self;
}

*/



@end
