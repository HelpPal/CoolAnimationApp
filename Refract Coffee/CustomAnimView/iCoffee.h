//
//  iCoffee.m
//  TestMe
//
//  Created by Mini Mac on 7/20/18.
//  Copyright © 2018 Mini Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESPView.h"
#import "CFEView.h"

@protocol iCoffeeDelegate <NSObject>
@optional
- (void)clearString;
@end

@interface iCoffee : UIView <UIGestureRecognizerDelegate, CFEViewDelegate, ESPViewDelegate>

@property (strong, nonatomic, readwrite) UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic, readwrite) UIPanGestureRecognizer *panGesture;

@property (strong, nonatomic) ESPView *espView;
@property (strong, nonatomic) CFEView *cfeView;
@property (strong, nonatomic) UIImageView *ecupView;
@property (strong, nonatomic) UIImageView *ccupView;
@property (strong, nonatomic) UILabel *ccupText;
@property (strong, nonatomic) UILabel *ecupText;
@property (nonatomic, weak) id <iCoffeeDelegate> delegate;
@property (assign, nonatomic) BOOL isEsp;

- (void)setupDefaults;
- (void)onTextInput:(NSString*)str;

@end
