//
//  AddDataVC.h
//  Refract Coffee
//
//  Created by Manish on 1/10/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "BaseVC.h"
#import "HomeVC.h"
@interface AddDataVC : BaseVC<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *recipeNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *tdsTextField;
@property (weak, nonatomic) IBOutlet UITextField *doseTextField;
@property (weak, nonatomic) IBOutlet UITextField *brewWaterTextField;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnAddEdit;

- (IBAction)removeRecipeAction:(UIButton *)sender;
- (IBAction)saveRecipeAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

@property (strong, nonatomic) IBOutlet UIView *alertView;

- (IBAction)cancelButtonAction:(UIButton *)sender;
- (IBAction)yesButtonAction:(UIButton *)sender;


@property (strong, nonatomic) NSMutableDictionary* coffeeDict;
@property (assign, nonatomic) BOOL isEdit;

@property (strong, nonatomic) FIRDatabaseReference *ref;
@end
