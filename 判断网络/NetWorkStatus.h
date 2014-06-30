//
//  NetWorkStatus.h
//  MailClient
//
//  Created by Ping on 14-6-30.
//  Copyright (c) 2014年 Ping@Flycent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkStatus : NSObject

+ (NetWorkStatus *)sharedNetWorkStatus;
- (BOOL)isNetWorkLink;
- (BOOL)isNetWorkLink:(NSString *)urlString;

@end
