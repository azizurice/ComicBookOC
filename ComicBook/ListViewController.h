//
//  FirstViewController.h
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComicData.h"
#import "AppTableViewCell.h"
#import "DetailViewController.h"
#import "MarvelServer.h"
#import "ImageDownload.h"

@interface ListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,MarvelServerDelegate>

    
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    
    
    -(void) getCharactersFromMarvel;

@end

