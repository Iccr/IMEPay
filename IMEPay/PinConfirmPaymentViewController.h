//
//  ConfirmPaymentViewController.h
//  IMEPay
//
//  Created by Manoj Karki on 7/12/17.
//  Copyright © 2017 Manoj Karki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTextField.h"
#import "BaseViewController.h"


#define PIN_MAX_LENGTH 4

@interface PinConfirmPaymentViewController : BaseViewController

#pragma mark:- IBOutlets

@property (weak, nonatomic) IBOutlet UILabel *mobileNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *merchantNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet BaseTextField* pinField;
@property (weak, nonatomic) IBOutlet UIView *infoContainer;

@property (strong, nonatomic) NSDictionary *paymentParams;

#pragma marK:- Success Failure Handlers

@property (nonatomic, copy) successBlock success;
@property (nonatomic, copy) failureBlock failure;

@end
