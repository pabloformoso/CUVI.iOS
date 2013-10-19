//
//  SWDataViewController.h
//  PruebaDePagina
//
//  Created by Pablo Formoso Estada on 18/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWDataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel2;
@property (strong, nonatomic) id dataObject;

@end
