//
//  HomeVC.h
//  Refract Coffee
//
//  Created by Manish on 27/09/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "BaseVC.h"
#import "HomeVC.h"
#import <APAvatarImageView.h>

@interface UserEditVC : BaseVC <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    BOOL isPhotoChanged;
}

@property (weak, nonatomic) IBOutlet APAvatarImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *newpassText;
@property (weak, nonatomic) IBOutlet UITextField *confirmText;

//Variables
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end
