//
//  SWMasterViewController.h
//  MasterDetail
//
//  Created by Pablo Formoso Estada on 18/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWDetailViewController;

@interface SWMasterViewController : UITableViewController

@property (strong, nonatomic) SWDetailViewController *detailViewController;

@end
