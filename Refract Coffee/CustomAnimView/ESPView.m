//
//  ESPView.m
//  TestMe
//
//  Created by Mini Mac on 7/24/18.
//  Copyright © 2018 Mini Mac. All rights reserved.
//

#import "ESPView.h"

@implementation ESPView

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self customInit];
    }
    
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self customInit];
    }
    
    return self;
}

- (void) customInit
{
    [[NSBundle mainBundle] loadNibNamed:@"ESPView" owner:self options:nil];
    [self addSubview:self.contentView];
    
    self.contentView.frame = self.bounds;
    
    self.img1.image = [UIImage imageNamed:@"buttonBackground"];
    self.img2.image = [UIImage imageNamed:@"null"];
    self.img3.image = [UIImage imageNamed:@"null"];
    
    self.view1.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];
    self.view2.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
    self.view3.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
    
//    self.txt1.text = [NSString stringWithFormat:@"%f", _value1];
//    self.txt2.text = [NSString stringWithFormat:@"%f", _value2];
//    self.txt3.text = [NSString stringWithFormat:@"%f", _value3];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == _txt1) {
        self.img1.image = [UIImage imageNamed:@"buttonBackground"];
        self.img2.image = [UIImage imageNamed:@"null"];
        self.img3.image = [UIImage imageNamed:@"null"];
        
        self.view1.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];
        self.view2.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
        self.view3.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
        
        [self.delegate clearAllText];
    }
    if (textField == _txt2) {
        self.img1.image = [UIImage imageNamed:@"null"];
        self.img2.image = [UIImage imageNamed:@"buttonBackground"];
        self.img3.image = [UIImage imageNamed:@"null"];
        
        self.view1.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
        self.view2.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];
        self.view3.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
        
        [self.delegate clearAllText];
    }
    if (textField == _txt3) {
        self.img1.image = [UIImage imageNamed:@"null"];
        self.img2.image = [UIImage imageNamed:@"null"];
        self.img3.image = [UIImage imageNamed:@"buttonBackground"];
        
        self.view1.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
        self.view2.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
        self.view3.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];
        
        [self.delegate clearAllText];
    }
    
    return NO;
}

@end
