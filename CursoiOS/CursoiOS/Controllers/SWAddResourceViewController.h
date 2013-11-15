//
//  SWAddResourceViewController.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWAddResourceViewController : UIViewController <UIScrollViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UITextField *descTextField;

- (IBAction)save:(id)sender;


@end
