//
//  Analytics.m
//  ObjCFramework
//
//  Created by Matthew Schmulen on 10/30/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

//#import "Analytics.h"
#import <Foundation/Foundation.h>


@interface AnalyticsState : NSObject

@property (nonatomic, strong) NSString *enterpriseID;
@property (nonatomic, strong) NSString *userOrganization;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userRole;

- (void)reset;

@end

@implementation AnalyticsState

- (void)reset {
    self.userID           = nil;
    self.enterpriseID     = nil;
    self.userOrganization = nil;
    self.userRole         = nil;
}

@end


@protocol AnalyticsProtocol <NSObject>

- (void)start;
- (void)stop;
- (void)logScreen:(NSString *)aScreen data:(NSDictionary *)aData;
- (void)logAction:(NSString *)anAction category:(NSString *)aCategory type:(NSString *)aType data:(NSDictionary *)aData;
- (BOOL)isAnalyticsURL:(NSURL *)url;

@end


@protocol AnalyticsDelegateProtocol <AnalyticsProtocol>

@property (nonatomic, strong) AnalyticsState *state;

@end

@interface Analytics : AnalyticsState <AnalyticsProtocol>

+ (instancetype)sharedAnalytics;

- (void)addDelegate:(id<AnalyticsDelegateProtocol>)delegate;
- (void)removeDelegate:(id<AnalyticsDelegateProtocol>)delegate;
- (void)reset;

@end

@interface Analytics : NSObject

+ (instancetype)sharedAnalytics:(NSString *)name;
- (void)start;
- (void)stop;
- (void)logScreen:(NSString *)aScreen data:(NSDictionary *)aData;
- (void)logAction:(NSString *)anAction category:(NSString *)aCategory type:(NSString *)aType data:(NSDictionary *)aData;
- (BOOL)isAnalyticsURL:(NSURL *)url;

@end

@interface Analytics ()
@property (nonatomic, strong) NSMutableArray *delegates;
@end

@implementation Analytics

+ (instancetype) sharedAnalytics:(NSString *)name
{
        static Analytics     *sSharedAnalytics = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sSharedAnalytics = [Analytics new];
            //sSharedAnalytics.delegates = [NSMutableArray new];
        });
        return sSharedAnalytics;
}

- (void)reset {
    //[super reset];
    for (id<AnalyticsDelegateProtocol> delegate in self.delegates) {
        [delegate stop];
        [delegate start];
    }
}

- (void)start {
    for (id<ELAnalyticsDelegateProtocol> delegate in self.delegates) {
        [delegate start];
    }
}

- (void)stop {
    for (id<ELAnalyticsDelegateProtocol> delegate in self.delegates) {
        [delegate stop];
    }
}

- (void)logScreen:(NSString *)aScreen data:(NSDictionary *)aData {
    for (id<ELAnalyticsDelegateProtocol> delegate in self.delegates) {
        [delegate logScreen:aScreen data:aData];
    }
}

- (void)logAction:(NSString *)anAction category:(NSString *)aCategory type:(NSString *)aType data:(NSDictionary *)aData {
    for (id<ELAnalyticsDelegateProtocol> delegate in self.delegates) {
        [delegate logAction:anAction category:aCategory type:aType data:aData];
    }
}

- (BOOL)isAnalyticsURL:(id)url {
    for (id<ELAnalyticsDelegateProtocol> delegate in self.delegates) {
        if ([delegate isAnalyticsURL:url]) {
            return YES;
        }
    }
    return NO;
}


@end


