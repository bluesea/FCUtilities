//
//  NetWorkStatus.m
//  MailClient
//
//  Created by Ping on 14-6-30.
//  Copyright (c) 2014年 Ping@Flycent. All rights reserved.
//

#import "NetWorkStatus.h"
#import "Reachability.h"

@implementation NetWorkStatus
+ (NetWorkStatus *)sharedNetWorkStatus
{
    static NetWorkStatus *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (BOOL)isNetWorkLink
{
    return [self isNetWorkLink:@"www.baidu.com"];
}

- (BOOL)isNetWorkLink:(NSString *)urlString
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus status = [reach currentReachabilityStatus];
    if (status == kReachableViaWWAN) {
        NSLog(@"2G或者3G");
        
    }else if (status == kReachableViaWiFi){
        
    }
    BOOL reachable = (status != kNotReachable);
    
    return reachable;
}

@end
