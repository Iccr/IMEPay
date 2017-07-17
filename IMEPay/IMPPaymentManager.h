//
//  IMPPaymentManager.h
//  IMEPay
//
//  Created by Manoj Karki on 7/13/17.
//  Copyright © 2017 Manoj Karki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionManager.h"

@interface IMPPaymentManager : NSObject

- (instancetype)initWithEnvironment:(APIEnvironment)environment;

- (void)pay:(NSString *)userName password:(NSString *)password  merchantCode:(NSString *)merchantCode merchantName: (NSString *)merchantName  merchantUrl:(NSString *)merchantUrl amount:(NSString *)amount customerMobileNumber:(NSString *)customerMobileNumber referenceId: (NSString *)referenceId module: (NSString *)module success: (void(^)(NSDictionary *transactionInfo))success failure: (void(^)(NSDictionary *transactionInfo))failure;

@end
