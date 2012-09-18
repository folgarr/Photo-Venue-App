//
//  PhotoViewController.m
//  Photo Venue
//
//  Created by Carlos Folgar on 8/4/12.
//  Copyright (c) 2012 Carlos Folgar. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController
@synthesize imageView;
@synthesize photo = _photo;
@synthesize photoTitle = _photoTitle;
@synthesize scrollableView = _scrollableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void) viewWillAppear:(BOOL)animated
{
    // Code for view will appear
    self.navigationItem.title = self.photoTitle;
    
    
    // Calculate the optimal zoom scale for the current photo each time a re-layout (like a rotation) is detected
    //float widthZoom = self.view.bounds.size.width / self.imageView.image.size.width;
    //float heightZoom = self.view.bounds.size.height / self.imageView.image.size.height;
    //self.scrollableView.zoomScale = MAX(widthZoom,heightZoom);
    
    
//    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y + 44, self.imageView.frame.size.width, self.imageView.frame.size.height);
    //[self.imageView setNeedsDisplay];
    //[self.imageView setNeedsLayout];
    //self.scrollableView.zoomScale = 1.5;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollableView.delegate = self;
    self.imageView.image = self.photo;
    
    
    // The image view frame should fill the bounds
    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    self.scrollableView.contentSize = self.imageView.image.size;
    self.scrollableView.scrollEnabled = YES;
    
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
//    self.navigationController.navigationBar.backgroundColor = [UIColor lightGrayColor];
//    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setNeedsDisplay];
    [self.scrollableView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTap:)]];
    
    
	// Do any additional setup after loading the view.
}

// Called everytime the screen is tapped - used to hide the navigation bar
-(void)imageViewTap: (UITapGestureRecognizer *) gesture
{
    if (self.navigationController.navigationBarHidden)
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    else
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self.navigationController.navigationBar setNeedsLayout];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setScrollableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


-(void)viewWillLayoutSubviews
{
    // Calculate the optimal zoom scale for the current photo each time a re-layout (like a rotation) is detected
    float widthZoom = self.imageView.bounds.size.width / self.imageView.image.size.width;
    float heightZoom = self.imageView.bounds.size.height / self.imageView.image.size.height;
    self.scrollableView.zoomScale = MAX(widthZoom,heightZoom);
    
}



-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
