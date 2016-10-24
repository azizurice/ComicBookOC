//
//  ImageDownload.m
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-24.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import "ImageDownload.h"

@implementation ImageDownload
    

    
    
    

-(AsyncDownloadBlock )downloadBlock:(NSString *)urlString withComicDataIndex:(int) index {
    return ^{
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
        if (data == nil) {
            return;
        }
        
      dispatch_async(dispatch_get_main_queue(), ^{
         
          
          [[[ComicData getCharacters] objectAtIndex:index] setImage:[UIImage imageWithData: data]];
           NSLog(@"Testing data .....................................%d",index);
          NSLog(@"%@", [[[ComicData getCharacters] objectAtIndex:index] image]);
          
                
            });
      };
    
}
    
    
    
- (void) downloadImage:(NSString *)urlString  withComicDataIndex:(int) index{
    dispatch_async(dispatch_get_global_queue(0,0), [self downloadBlock:urlString withComicDataIndex:index]);
}



@end
