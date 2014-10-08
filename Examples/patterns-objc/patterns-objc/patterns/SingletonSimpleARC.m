//
//  SingletonSimple.m
//  patterns-objc
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

#import "SingletonSimpleARC.h"

@implementation SingletonSimpleARC

@synthesize someProperty;

+ (id) getSingleton {
    static SingletonSimpleARC *mySingleton = nil;
    
    @synchronized( self ) {
        if ( mySingleton == nil )
        {
            mySingleton = [[self alloc] init];
        }
    }
    return mySingleton;
}


- (id) init {
    
    if ( self = [super init])
    {
        //someProperty = [[NSString alloc] initWithString:@"yack yack "];
        someProperty = @"yack yack ";
    }
    
    return self;
}

- ( void ) dealloc   {
    
    // This is never used ... its a Singleton
}

@end
