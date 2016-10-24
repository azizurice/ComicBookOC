//
//  AppTableViewCell.h
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComicData.h"

@interface AppTableViewCell : UITableViewCell
    
    @property (weak, nonatomic) IBOutlet UIImageView *imageView;
    
    @property (weak, nonatomic) IBOutlet UILabel *captionLableView;

    -(void) updateUI:(ComicData*) comicData;
@end
