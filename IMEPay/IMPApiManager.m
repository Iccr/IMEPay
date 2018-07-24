//
//  IMPApiManager.m
//  IMEPay
//
//  Created by Manoj Karki on 7/12/17.
//  Copyright © 2017 Manoj Karki. All rights reserved.
//

#import "IMPApiManager.h"
#import <AFNetworking/AFNetworking.h>
#import "Config.h"
#import "Helper.h"
#import "SessionManager.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

@implementation IMPApiManager

- (NSString *)url:(NSString *)endpoint {
    SessionManager *manager = [SessionManager sharedInstance];
    if (manager.environment == Test)
        return [NSString stringWithFormat:@"%@%@",URL_BASE_TEST, endpoint];
    return [NSString stringWithFormat:@"%@%@",URL_BASE_LIVE, endpoint];
}

- (void)getToken:(NSDictionary *)params success:(void(^)(NSDictionary *tokenInfo))success failure: (void (^) (NSString *error))failure {
    SessionManager *manager = [SessionManager sharedInstance];
    
    //NSLog(@"module string %@", [manager module]);
    
    NSLog(@"headers %@", [manager headers]);
    
    NSString *url = [self url:EP_GET_TOKEN];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"GET TOKEN RESPONSE %@", responseObject);
        
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
    }];
}

- (void)postToMerchant: (NSString *)merchantUrl parameters: (NSDictionary *)params success: (void (^)())success failure:(void (^)(NSString *))failure {
  
    SessionManager *manager  = [SessionManager sharedInstance];
    [manager POST:merchantUrl parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"POST TO MERCHANT RESPONSE %@", responseObject);
        success();
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
    }];
}

- (void)makePayment:(NSDictionary *)params success:(void(^)(NSDictionary *info))success failure:(void (^)(NSString *error))failure {
    SessionManager *manager  = [SessionManager sharedInstance];
    [manager POST:[self url:EP_PAYMENT] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
    }];
}

- (void)confirmPayment:(NSDictionary *)params success:(void (^)(NSDictionary *info))success failure:(void (^)(NSString *error))failure {
    SessionManager *manager  = [SessionManager sharedInstance];
    [manager POST:[self url:EP_CONFIRM] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
    }];
}

- (void)validateUser:(NSDictionary *)params success:(void (^)(NSString *))success failure:(void (^)(NSString *))failure {

    SessionManager *manager  = [SessionManager sharedInstance];
    [manager POST:[self url:EP_VALIDATE_USER] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"validate user response %@", responseObject);
        if (responseObject != nil) {
            NSDictionary *responseDic = (NSDictionary *)responseObject;
            NSString *OTP =  (NSString *)responseDic[@"Otp"];
            NSNumber *responseCode = (NSNumber *)responseDic[@"ResponseCode"];
            if (responseCode.integerValue == 100) {
                success(OTP);
            }else {
                NSString *responseDescription = responseDic[@"ResponseDescription"];
                failure(responseDescription);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"validate user error %@", error.localizedDescription);
        failure(error.localizedDescription);
    }];
}

@end

#pragma clang diagnostic pop
