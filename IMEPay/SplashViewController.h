//
//  SplashViewController.h
//  IMEPay
//
//  Created by Manoj Karki on 7/12/17.
//  Copyright © 2017 Manoj Karki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (strong, nonatomic) NSDictionary *paymentParams;
@property (nonatomic, copy) void(^successBlock)(NSDictionary *info);
@property (nonatomic, copy) void(^failureBlock)(NSDictionary *info);
    
@end
