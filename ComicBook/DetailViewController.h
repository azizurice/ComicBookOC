//
//  DetailViewController.h
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComicData.h"

@interface DetailViewController : UIViewController
    
    
    @property (weak, nonatomic) IBOutlet UIImageView *imageView;
    @property (weak, nonatomic) IBOutlet UILabel *captionView;
    
    @property (weak, nonatomic) IBOutlet UILabel *detailView;
    
    @property ComicData* comicData;

@end
