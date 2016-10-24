//
//  AppTableViewCell.m
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import "AppTableViewCell.h"

@implementation AppTableViewCell
    
    @synthesize imageView;
    @synthesize  captionLableView;
    

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
    
    -(void) updateUI:(ComicData *)comicData{
        imageView.image = [comicData image];
        captionLableView.text = [comicData title];
        
        imageView.layer.shadowColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
        imageView.layer.shadowRadius = 6;
        imageView.layer.shadowOpacity = 1;
        
        
       
    }
    


@end
