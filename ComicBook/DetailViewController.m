//
//  DetailViewController.m
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
    

@end

@implementation DetailViewController
    @synthesize imageView;
    @synthesize captionView;
    @synthesize detailView;
    
    @synthesize comicData;
    

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    captionView.text = [comicData title];
    detailView.text = [comicData detail];
     imageView.image = [comicData image];
    
    
    imageView.layer.shadowColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
    imageView.layer.shadowRadius = 6;
    imageView.layer.shadowOpacity = 1;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
