//
//  SingletonNoARC.h
//  patterns-objc
//
//  Created by Matt Schmulen on 10/8/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonNoARC : NSObject {
        NSString *myProp;
}

@property (nonatomic, retain) NSString *myProp;

+ (id) getSingleton;

@end
