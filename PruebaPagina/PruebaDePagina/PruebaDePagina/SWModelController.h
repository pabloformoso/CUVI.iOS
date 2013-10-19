//
//  SWModelController.h
//  PruebaDePagina
//
//  Created by Pablo Formoso Estada on 18/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWDataViewController;

@interface SWModelController : NSObject <UIPageViewControllerDataSource>

- (SWDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(SWDataViewController *)viewController;

@end
