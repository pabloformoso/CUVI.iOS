//
//  SWResourcesViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 15/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWResource.h"
#import "SWWebCell.h"
#import "SWResourcesJsonService.h"
#import "SWResourcesViewController.h"

@interface SWResourcesViewController ()

@property (nonatomic, strong) NSArray *resources;

@end

@implementation SWResourcesViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
  [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  SWResourcesJsonService *ws = [[SWResourcesJsonService alloc] init];
  [ws getResourcesForController:self];
  
}

- (void)updateView:(NSArray *)anArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  _resources = [[NSArray alloc] initWithArray:anArray];
  [self.collectionView reloadData];
}

#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  return [_resources count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif

  SWResource *temp = [_resources objectAtIndex:indexPath.row];
  
  SWWebCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WebCell" forIndexPath:indexPath];
  
  [cell.titleLabel setText:temp.name];
  [cell.descLabel setText:temp.description];
  
  return cell;

}

#pragma mark - UICollectionView Delegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  cell.backgroundColor = [UIColor yellowColor];
  
  // to mantain selection check on the DataSource
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  cell.backgroundColor = [UIColor whiteColor];
  
  return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  // Do something while highlighting
  
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  float modColor = (float)indexPath.row*2 / 255.0;
  
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  cell.backgroundColor = [UIColor colorWithRed:modColor green:modColor blue:modColor alpha:1];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  return (indexPath.row == 1);
}

#pragma mark - Navegacion
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  NSIndexPath *path = [self.collectionView.indexPathsForSelectedItems objectAtIndex:0];
  SWResource *res = [_resources objectAtIndex:path.row];
  
  if ([segue.destinationViewController respondsToSelector:@selector(setResource:)]) {
    [segue.destinationViewController performSelector:@selector(setResource:) withObject:res];
  }
}

@end
