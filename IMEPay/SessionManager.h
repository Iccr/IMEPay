//
//  Auth.h
//  Foodmandu
//
//  Created by Manoj Karki on 8/17/16.
//  Copyright © Manoj Karki All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface SessionManager : AFHTTPSessionManager

+ (id)sharedInstance;

@property (nonatomic, assign) APIEnvironment environment;

- (void)setAccessToken:(NSString *)token;

- (void)setModule:(NSString *)moduleString;

@end
