//
//  SWClassesTableViewController.m
//  CursoiOS
//
//  Created by Pablo Formoso Estada on 25/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "SWClass.h"
#import "SWCellClass.h"
#import "SWClassesTableViewController.h"

@interface SWClassesTableViewController ()

@property(nonatomic,strong) NSArray *classes;

@end

@implementation SWClassesTableViewController

- (void)viewDidLoad {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    [super viewDidLoad];
    [self loadData];
    
    self.clearsSelectionOnViewWillAppear = YES;
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_classes count]; // El tamaño del array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
#ifndef NDEBUG
    NSLog(@"%s (line:%d) %i", __PRETTY_FUNCTION__, __LINE__, indexPath.row);
#endif
    
    static NSString *CellIdentifier = @"Cell";
    SWCellClass *cell = (SWCellClass *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    SWClass *tmpClass = [_classes objectAtIndex:indexPath.row];
    
    cell.className.text = tmpClass.name;
    cell.startLabel.text = [NSString stringWithFormat:@"%@", tmpClass.startDate];
    cell.endLabel.text = [NSString stringWithFormat:@"%@", tmpClass.endDate];
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) %@ - %@", __PRETTY_FUNCTION__, __LINE__, [sender class], segue.identifier);
#endif
    
    int selectedItem = self.tableView.indexPathForSelectedRow.row;
    SWClass *tmp = [_classes objectAtIndex:selectedItem];
    
    if ([segue.destinationViewController respondsToSelector:@selector(setSelectedClass:)]) {
        
        [segue.destinationViewController performSelector:@selector(setSelectedClass:) withObject:tmp];
        
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
       *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)loadData {
#ifndef NDEBUG
    NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    _classes = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefaults objectForKey:@"classes_array"]];
    
}












@end
