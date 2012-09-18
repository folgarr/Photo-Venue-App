//
//  PhotoListViewController.m
//  Photo Venue
//
//  Created by Carlos Folgar on 8/15/12.
//  Copyright (c) 2012 Carlos Folgar. All rights reserved.
//

#import "PhotoListViewController.h"
#import "PhotoViewController.h"
#import "FlickrFetcher.h"
#import "FlickrAPIKey.h"

@interface PhotoListViewController ()

@end

@implementation PhotoListViewController
@synthesize photoList = _photoList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"First image: %@", [self.photoList objectAtIndex:0]);
//    NSLog(@"Second image: %@", [self.photoList objectAtIndex:1]);
//    NSLog(@"Third image: %@", [self.photoList objectAtIndex:2]);
//    NSLog(@"Fourth image: %@", [self.photoList objectAtIndex:3]);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // REVISIT: Possibly add ability to section by country
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.photoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Top Place Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    // Set the cell's title and subtitle
    cell.textLabel.text = [[self.photoList objectAtIndex:indexPath.row] valueForKeyPath:@"title"];
    cell.detailTextLabel.text = [[self.photoList objectAtIndex:indexPath.row] valueForKeyPath:@"description._content"];
    
    if ([cell.textLabel.text isEqualToString:@""] && ![cell.detailTextLabel.text isEqualToString:@""])
    {
        cell.textLabel.text = cell.detailTextLabel.text;
        cell.detailTextLabel.text = @"";
    }
    else if ([cell.textLabel.text isEqualToString:@""] && [cell.detailTextLabel.text isEqualToString:@""])
    {
        cell.textLabel.text = @"Untitled";
    }
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Set the items in the photo list (array) of the destination "PhotoListViewController"
    if ([segue.identifier isEqualToString:@"photoListToImage"])
    {
        NSURL *selectedPhotoURL = [FlickrFetcher urlForPhoto:[self.photoList objectAtIndex:self.tableView.indexPathForSelectedRow.row] format:FlickrPhotoFormatLarge];
        NSData *selectedPhotoData = [NSData dataWithContentsOfURL:selectedPhotoURL];
        UIImage *selectedPhoto = [UIImage imageWithData:selectedPhotoData];
        [segue.destinationViewController setPhoto:selectedPhoto];
        
        // Pass the cells title to be used on the navigation bar of the other cell
        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:self.tableView.indexPathForSelectedRow];
        [segue.destinationViewController setPhotoTitle: selectedCell.textLabel.text];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    // Ensure that any previously selected rows do not appear as selected
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:NO];
    
    if (self.navigationController.navigationBar.barStyle != UIBarStyleDefault) self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
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


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
