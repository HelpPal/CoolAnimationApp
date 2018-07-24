//
//  HomeVC.m
//  Refract Coffee
//
//  Created by Manish on 27/09/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "UserEditVC.h"


@interface UserEditVC () {
    NSString *imageData;
}
@end

@implementation UserEditVC

#pragma mark - View Controller Delegates
- (void)viewDidLoad {
    [super viewDidLoad];
    self.ref = [[FIRDatabase database] reference];
    isPhotoChanged = false;
    [self loadProfile];
}

-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    imageData = [self encodeToBase64String:self.profileImageView.image];
}

- (void) loadProfile {
    
    self.picker = [[UIImagePickerController alloc]init];
    self.picker.delegate = self;
    
    self.profileImageView.borderColor = [UIColor whiteColor];
    self.emailText.text = [self getDefaults:EMAIL];
    
    if ([self getDefaults:PROFILEIMAGE] != nil) {
        UIImage *image = [self decodeBase64ToImage:[self getDefaults:PROFILEIMAGE]];
        self.profileImageView.image = image;
    }
}

#pragma mark - IBActions
- (IBAction)saveAction:(UIButton *)sender {
    
    FIRUser *user = [FIRAuth auth].currentUser;
    NSString* userId = [self getDefaults:USERID];
    NSString* oldEmail = [self getDefaults:EMAIL];
    NSString* newEmail = _emailText.text;
    NSString *newPassword = _newpassText.text;
    NSString *confirmPassword = _confirmText.text;
    
    if (![oldEmail isEqualToString:newEmail]) {
        [user updateEmail:newEmail completion:^(NSError *_Nullable error) {
            if (error) {
                _emailText.text = oldEmail;
                [self showAlert:error.localizedDescription title:@"Error"];
            } else {
                [self setDefaults:newEmail forKey:EMAIL];
                [self showAlert:@"Success! Your Email has been changed!" title:@"Success!"];
            }
        }];
    }
    
    if (![newPassword isEqualToString:@""]) {
        if ([newPassword isEqualToString:confirmPassword]) {
            [user updatePassword:newPassword completion:^(NSError *_Nullable error) {
                if (error) {
                    [self showAlert:error.localizedDescription title:@"Error"];
                } else {
                    [self showAlert:@"Success! Your Password has been changed!" title:@"Success!"];
                }
            }];
        }
        else [self showAlert:@"Your password and confirmation password do not match." title:@"Error"];
    }
    
    if (isPhotoChanged) {
        [SVProgressHUD show];
        [[[self.ref child:USERS] child: userId] setValue:@{PROFILEIMAGE: imageData}];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [SVProgressHUD dismiss];
            [self setDefaults:imageData forKey:PROFILEIMAGE];
            [self showAlert:@"Success! Your Photo has been changed!" title:@"Success!"];
        });
    }
}

- (IBAction)pickPhotoAction:(UIButton *)sender {
    
    UIAlertController *alert = [UIAlertController  alertControllerWithTitle:@"Pick Image" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        isPhotoChanged = false;
        self.picker.allowsEditing = false;
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.picker animated:true completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        isPhotoChanged = false;
        self.picker.allowsEditing = false;
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.picker animated:true completion:nil];
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

#pragma mark UIImagePicker Delegates
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [self dismissViewControllerAnimated:true completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.profileImageView setImage:image];
    imageData = [self encodeToBase64String:image];
    isPhotoChanged = true;
}

- (IBAction)onback:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImageJPEGRepresentation(image, 0.5) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

#pragma mark DeCode Image
- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}
@end
