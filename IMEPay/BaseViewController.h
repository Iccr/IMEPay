//
//  BaseViewController.h
//  IMEPay
//
//  Created by Manoj Karki on 8/10/18.
//  Copyright © 2018 Manoj Karki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"

@interface BaseViewController: UIViewController

- (void)addCancelButton;
- (void)dissmissVc;
- (void)addLogoTitle;
- (void)addCloseButton;
- (void)addDissmissButton;
- (void)addCancelButtonWithAlert;

@end

