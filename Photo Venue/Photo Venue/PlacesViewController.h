//
//  PlacesViewController.h
//  Photo Venue
//
//  Created by Carlos Folgar on 8/4/12.
//  Copyright (c) 2012 Carlos Folgar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesViewController : UITableViewController
@property (nonatomic, strong) NSArray *content;
@property (nonatomic, strong) NSDictionary *selectedPlace;
@end
