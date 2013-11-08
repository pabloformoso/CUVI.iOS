//
//  SWClassesTableViewController.h
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 25/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWClassesTableViewController : UITableViewController

- (void)updateView:(NSArray *)aArray;
- (void)updateViewFailed;

@end
