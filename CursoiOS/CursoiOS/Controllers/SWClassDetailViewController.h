//
//  SWClassDetailViewController.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 26/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
@class SWClass;
#import <UIKit/UIKit.h>

@interface SWClassDetailViewController : UIViewController

@property (nonatomic, strong) SWClass *selectedClass;

@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;

@end
