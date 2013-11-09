//
//  SWStudentsTableViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 09/11/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "SWStudentsJsonService.h"
#import "SWStudent.h"
#import "SWCellStundet.h"
#import "SWStudentsTableViewController.h"

@interface SWStudentsTableViewController ()

@property (nonatomic, strong) NSMutableArray *stundets;

@end

@implementation SWStudentsTableViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
    [super viewDidLoad];
    [self loadData];
  
    self.clearsSelectionOnViewWillAppear = YES;
}

- (void)didReceiveMemoryWarning {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_stundets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StudentCell";
    SWCellStundet *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
    SWStudent *tmp = [_stundets objectAtIndex:indexPath.row];
  
    [cell.nameLabel setText:tmp.name];
    [cell.cityLabel setText:tmp.city];
    [cell.avatarImageView setImageWithURL:[tmp getAvatarURL]
                         placeholderImage:[UIImage imageNamed:@"placeholder.JPG"]];
  
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
}


- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  
  SWStudentsJsonService *ws = [[SWStudentsJsonService alloc] init];
  [ws getStudentsForController:self];
  
}

- (void)updateView:(NSArray *)aArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _stundets = [[NSMutableArray alloc] initWithArray:aArray];
  [self.tableView reloadData];
  
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
  
}

- (void)updateViewFailed {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:@"No se ha podido conectar"
                                                 delegate:nil
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
  
  [alert show];
  
}


@end
