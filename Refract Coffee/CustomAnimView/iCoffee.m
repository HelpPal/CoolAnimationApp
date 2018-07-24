//
//  iCoffee.m
//  TestMe
//
//  Created by Mini Mac on 7/20/18.
//  Copyright © 2018 Mini Mac. All rights reserved.
//

#define CUP_RADIOUS 90

#import "iCoffee.h"

@interface iCoffee ()
{
    double rotateAngle;
}
@end

@implementation iCoffee

- (void)setupDefaults {
    
    self.isEsp = YES;
    rotateAngle = 0;
    self.clipsToBounds = YES;
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    self.panGesture.delegate = self;
    self.panGesture.minimumNumberOfTouches = 1;
    self.panGesture.maximumNumberOfTouches = 1;
    self.panGesture.cancelsTouchesInView = YES;
    [self addGestureRecognizer:self.panGesture];
    
    self.ccupView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 40, self.frame.size.height/2 - 25, 2*CUP_RADIOUS, 2*CUP_RADIOUS)];
    self.ccupView.image = [UIImage imageNamed:@"cCup"];
    [self addSubview:self.ccupView];
    
    self.ecupView = [[UIImageView alloc] initWithFrame:CGRectMake(3*self.frame.size.width/2 - 40, self.frame.size.height/2 - 25, 2*CUP_RADIOUS, 2*CUP_RADIOUS)];
    self.ecupView.image = [UIImage imageNamed:@"eCup"];
    [self addSubview:self.ecupView];
    
    self.cfeView =[[CFEView alloc]initWithFrame:CGRectMake(0, 80, 75, 200)];
    self.cfeView.delegate = self;
    [self addSubview:self.cfeView];
    
    self.espView =[[ESPView alloc]initWithFrame:CGRectMake(-75, 80, 75, 150)];
    self.espView.delegate = self;
    [self addSubview:self.espView];
    
    self.ccupText =[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 30, 29, 100, 40)];
    self.ccupText.text = @"Coffee";
    self.ccupText.font = [UIFont fontWithName:@"Rubik" size:16];
    self.ccupText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.ccupText];
    
    self.ecupText =[[UILabel alloc] initWithFrame:CGRectMake(3*self.frame.size.width/2 - 30, 29, 100, 40)];
    self.ecupText.text = @"Espresso";
    self.ecupText.font = [UIFont fontWithName:@"Rubik" size:16];
    self.ecupText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.ecupText];
}

- (void)panGesture:(UIPanGestureRecognizer *)gestureRecognizer {
 
    CGPoint translatedPoint = [gestureRecognizer translationInView:self];
    CGPoint translatedPoint1 = [gestureRecognizer translationInView:self];
    CGPoint translatedPoint2 = [gestureRecognizer translationInView:self];
    CGPoint translatedPoint3 = [gestureRecognizer translationInView:self];
    CGPoint translatedPoint4 = [gestureRecognizer translationInView:self];
    CGPoint translatedPoint5 = [gestureRecognizer translationInView:self];
    
    translatedPoint = CGPointMake(self.cfeView.center.x+translatedPoint.x/3, self.cfeView.center.y);
    translatedPoint1 = CGPointMake(self.espView.center.x-translatedPoint1.x/3, self.espView.center.y);
    translatedPoint2 = CGPointMake(self.ccupView.center.x+2*translatedPoint2.x, self.ccupView.center.y);
    translatedPoint3 = CGPointMake(self.ecupView.center.x+2*translatedPoint3.x, self.ecupView.center.y);
    translatedPoint4 = CGPointMake(self.ccupText.center.x+2*translatedPoint4.x, self.ccupText.center.y);
    translatedPoint5 = CGPointMake(self.ecupText.center.x+2*translatedPoint5.x, self.ecupText.center.y);
    
    if (self.isEsp) {
        if (translatedPoint.x < 0) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.2];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(onChangeFlag)];
            
            [self.cfeView setCenter:CGPointMake(- self.cfeView.frame.size.width/2, self.cfeView.center.y)];
            [self.espView setCenter:CGPointMake(self.espView.frame.size.width/2, self.espView.center.y)];
            
            [self.ccupView setCenter:CGPointMake(-self.frame.size.width/2 - 40 + CUP_RADIOUS, self.ccupView.center.y)];
            self.ccupView.alpha = 0;
            
            [self.ecupView setCenter:CGPointMake(self.frame.size.width/2 - 40 + CUP_RADIOUS, self.ecupView.center.y)];
            self.ecupView.alpha = 1;
            
            [self.ccupText setCenter:CGPointMake(-self.frame.size.width/2, self.ccupText.center.y)];
            self.ccupText.alpha = 0;
            
            [self.ecupText setCenter:CGPointMake(self.frame.size.width/2, self.ecupText.center.y)];
            self.ecupText.alpha = 1;
            
            [UIView commitAnimations];
        }
        else{
            
            if (translatedPoint.x < self.cfeView.frame.size.width/2) {
               
                [self.cfeView setCenter:translatedPoint];
                [self.espView setCenter:translatedPoint1];
                [self.ccupView setCenter:translatedPoint2];
                [self.ecupView setCenter:translatedPoint3];
                [self.ccupText setCenter:translatedPoint4];
                [self.ecupText setCenter:translatedPoint5];
                
                self.ecupView.alpha = self.ecupView.alpha + 0.01;
                self.ccupView.alpha = self.ccupView.alpha - 0.01;
                self.ecupText.alpha = self.ecupView.alpha + 0.1;
                self.ccupText.alpha = self.ccupView.alpha - 0.1;
                
                rotateAngle = rotateAngle + M_PI/90;
                CGAffineTransform transform = CGAffineTransformMakeRotation(-rotateAngle);
                self.ccupView.transform = transform;
            }
            
            [gestureRecognizer setTranslation:CGPointZero inView:self];
        }
        
        if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
            
            if (translatedPoint.x > 0) {
                
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.2];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                [UIView setAnimationDelegate:self];
                
                [self.espView setCenter:CGPointMake(-self.espView.frame.size.width/2, self.espView.center.y)];
                [self.cfeView setCenter:CGPointMake(self.cfeView.frame.size.width/2, self.cfeView.center.y)];
                
                [self.ccupView setCenter:CGPointMake(self.frame.size.width/2 - 40 + CUP_RADIOUS, self.ccupView.center.y)];
                self.ccupView.alpha = 1;
                
                rotateAngle = 0;
                CGAffineTransform transform = CGAffineTransformMakeRotation(rotateAngle);
                self.ccupView.transform = transform;
                
                [self.ecupView setCenter:CGPointMake(3*self.frame.size.width/2 - 40 + CUP_RADIOUS, self.ecupView.center.y)];
                self.ecupView.alpha = 0;
                
                [self.ccupText setCenter:CGPointMake(self.frame.size.width/2, self.ccupText.center.y)];
                self.ccupText.alpha = 1;
                
                [self.ecupText setCenter:CGPointMake(3*self.frame.size.width/2, self.ecupText.center.y)];
                self.ecupText.alpha = 0;
                
                [UIView commitAnimations];
            }
        }
    }
    else
    {
        if (translatedPoint.x >0) {
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.2];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(onChangeFlag)];
            
            [self.cfeView setCenter:CGPointMake(self.cfeView.frame.size.width/2, self.cfeView.center.y)];
            [self.espView setCenter:CGPointMake(-self.espView.frame.size.width/2, self.espView.center.y)];
            
            [self.ccupView setCenter:CGPointMake(self.frame.size.width/2 - 40 + CUP_RADIOUS, self.ccupView.center.y)];
            self.ccupView.alpha = 1;
            
            [self.ecupView setCenter:CGPointMake(3*self.frame.size.width/2 - 40 + CUP_RADIOUS, self.ecupView.center.y)];
            self.ecupView.alpha = 0;
            
            rotateAngle = 0;
            CGAffineTransform transform = CGAffineTransformMakeRotation(rotateAngle);
            self.ccupView.transform = transform;
            
            [self.ccupText setCenter:CGPointMake(self.frame.size.width/2, self.ccupText.center.y)];
            self.ccupText.alpha = 1;
            
            [self.ecupText setCenter:CGPointMake(3*self.frame.size.width/2, self.ecupText.center.y)];
            self.ecupText.alpha = 0;
            
            [UIView commitAnimations];
        }
        else{
            
            if (translatedPoint.x > -self.espView.frame.size.width/2) {
                
                [self.cfeView setCenter:translatedPoint];
                [self.espView setCenter:translatedPoint1];
                [self.ccupView setCenter:translatedPoint2];
                [self.ecupView setCenter:translatedPoint3];
                [self.ccupText setCenter:translatedPoint4];
                [self.ecupText setCenter:translatedPoint5];
                
                self.ecupView.alpha = self.ecupView.alpha - 0.01;
                self.ccupView.alpha = self.ccupView.alpha + 0.01;
                self.ecupText.alpha = self.ecupView.alpha - 0.1;
                self.ccupText.alpha = self.ccupView.alpha + 0.1;
                
                rotateAngle = rotateAngle - M_PI/90;
                CGAffineTransform transform = CGAffineTransformMakeRotation(-rotateAngle);
                self.ccupView.transform = transform;
            }

            [gestureRecognizer setTranslation:CGPointZero inView:self];
        }
        
        if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
            
            if (translatedPoint.x < 0) {
                
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.2];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                [UIView setAnimationDelegate:self];
                
                [self.cfeView setCenter:CGPointMake(- self.cfeView.frame.size.width/2, self.cfeView.center.y)];
                [self.espView setCenter:CGPointMake(self.espView.frame.size.width/2, self.espView.center.y)];
                
                [self.ccupView setCenter:CGPointMake(-self.frame.size.width/2 - 40 + CUP_RADIOUS, self.ccupView.center.y)];
                self.ccupView.alpha = 0;
                
                [self.ecupView setCenter:CGPointMake(self.frame.size.width/2 - 40 + CUP_RADIOUS, self.ecupView.center.y)];
                self.ecupView.alpha = 1;
                
                [self.ccupText setCenter:CGPointMake(-self.frame.size.width/2, self.ccupText.center.y)];
                self.ccupText.alpha = 0;
                
                [self.ecupText setCenter:CGPointMake(self.frame.size.width/2, self.ecupText.center.y)];
                self.ecupText.alpha = 1;
                
                [UIView commitAnimations];
            }
        }
    }
    
}

- (void) onChangeFlag{
    self.isEsp = !self.isEsp;
}

- (void)onTextInput:(NSString*)str
{
    if (self.isEsp) {
        
        if(self.cfeView.img1.image)
        {
            self.cfeView.txt1.text = str;
        }
        
        if(self.cfeView.img2.image)
        {
            self.cfeView.txt2.text = str;
        }
        
        if(self.cfeView.img3.image)
        {
            self.cfeView.txt3.text = str;
        }
        
        if(self.cfeView.img4.image)
        {
            self.cfeView.txt4.text = str;
        }
    }
    else
    {
        if(self.espView.img1.image)
        {
            self.espView.txt1.text = str;
        }
        
        if(self.espView.img2.image)
        {
            self.espView.txt2.text = str;
        }
        
        if(self.espView.img3.image)
        {
            self.espView.txt3.text = str;
        }
    }
    
    
}

- (void) clearAllText
{
    [self.delegate clearString];
}

- (void) clearText
{
    [self.delegate clearString];
}

@end
