//
//  PlacesViewController.m
//  Photo Venue
//
//  Created by Carlos Folgar on 8/4/12.
//  Copyright (c) 2012 Carlos Folgar. All rights reserved.
//

#import "PlacesViewController.h"
#import "FlickrFetcher.h"
#import "FlickrAPIKey.h"
#import "PhotoListViewController.h"

@interface PlacesViewController ()
@end

@implementation PlacesViewController
@synthesize content = _content;
@synthesize selectedPlace = _selectedPlace;

// Uses the passed in content string to save the city & state/province in an array
-(NSArray *)extractTitleAndSubtitle:(NSString *) content
{
    NSArray *contentLines = [content componentsSeparatedByString:@","];
    if (contentLines.count > 2)
    {
        // Obtain the raw title and raw subtitle 
        NSString *title = [contentLines objectAtIndex:0];
        NSString *subtitle = [NSString stringWithFormat:@"%@,%@",[contentLines objectAtIndex:1],[contentLines objectAtIndex:2]];
        
        // Remove commas/extra spaces
        title = [title substringToIndex:title.length];
        subtitle = [subtitle substringFromIndex:1];
        
        // Return with array first object as the "city" (title) and the subtitle being "state/province, county" (subtitle)
        return [NSArray arrayWithObjects: title , subtitle, nil];
    }
    else if (contentLines.count == 2) // Simplified Title/Subtitle - e.g. "Berlin, Germany"
    {
        // Obtain the raw title and raw subtitle
        NSString *title = [contentLines objectAtIndex:0];
        NSString *subtitle = [contentLines lastObject];
        
        // Remove commas/extra spaces
        title = [title substringToIndex:title.length];
        subtitle = [subtitle substringFromIndex:1];
        
        return [NSArray arrayWithObjects: title, subtitle, nil];
    }
    else return [NSArray arrayWithObjects:contentLines,@"Unknown", nil];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
//        self.navigationController.tabBarItem.title = @"Venues";
//        self.tabBarItem.title = @"Venues";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.content = [FlickrFetcher topPlaces];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated
{
    // Ensure that any previously selected rows do not appear as selected
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:NO];
    
    if (self.navigationController.navigationBar.barStyle != UIBarStyleDefault) self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Set the items in the photo list (array) of the destination "PhotoListViewController"
    if ([segue.identifier isEqualToString:@"placesToPhotoList"])
    {
        self.selectedPlace = [self.content objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        [segue.destinationViewController setPhotoList:[FlickrFetcher photosInPlace:self.selectedPlace maxResults:50]];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // REVISIT: Add the ability to section the table cells by country
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of cities (_content) we have loaded
    return _content.count;
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
    NSArray *cellInfo = [self extractTitleAndSubtitle:[[_content objectAtIndex:indexPath.row] valueForKeyPath:@"_content"]];
    
    // Set the cell's title and subtitle
    cell.textLabel.text = [cellInfo objectAtIndex:0];
    cell.detailTextLabel.text = [cellInfo objectAtIndex:1];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedPlace = [self.content objectAtIndex:indexPath.row];
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
