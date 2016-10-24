//
//  ImageDownload.h
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-24.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComicData.h"

@interface ImageDownload : NSObject{

}
    
typedef void (^AsyncDownloadBlock)(void);
    
- (AsyncDownloadBlock) downloadBlock :(NSString *)urlString withComicDataIndex:(int) index;
    
-(void) downloadImage:(NSString *) urlString withComicDataIndex:(int) index;

@end
