//
//  ESPView.h
//  TestMe
//
//  Created by Mini Mac on 7/24/18.
//  Copyright © 2018 Mini Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ESPViewDelegate <NSObject>
@optional
- (void)clearAllText;
@end

@interface ESPView : UIView <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UIView *view3;

@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;

@property (strong, nonatomic) IBOutlet UITextField *txt1;
@property (strong, nonatomic) IBOutlet UITextField *txt2;
@property (strong, nonatomic) IBOutlet UITextField *txt3;

@property double value1;
@property double value2;
@property double value3;

@property (nonatomic, weak) id <ESPViewDelegate> delegate;

@end
