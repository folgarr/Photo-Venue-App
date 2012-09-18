//
//  PhotoViewController.h
//  Photo Venue
//
//  Created by Carlos Folgar on 8/4/12.
//  Copyright (c) 2012 Carlos Folgar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage *photo;
@property (weak, nonatomic) NSString *photoTitle;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollableView;

@end
