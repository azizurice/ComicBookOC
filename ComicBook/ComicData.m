//
//  ComicData.m
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-24.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import "ComicData.h"

static NSMutableArray *characterArray = nil;

@implementation ComicData
    
    
-(id) initWithName:(NSString *)title detail:(NSString *)detail andImageURL:(NSString *)imageURL{
  

    
        self.title=title;
        self.detail=detail;
        self.imageURL = imageURL;
        self.image =nil;
        return self;
    }
    
    +(NSArray*) getCharacters{
        
        return characterArray;
        
    }
    

+ (void) parsedJSONData:(NSDictionary *) jsonData {
  
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        characterArray =[[NSMutableArray alloc]init];
    });
    
        NSMutableArray *resultsArray = jsonData[@"results"];
        
        for (int i=0; i<[resultsArray count]; i++) {
            NSDictionary *comicBook = [resultsArray objectAtIndex:i];
            NSString *titleTemp = comicBook[@"title"];
            NSLog(@ "The title is : %@", titleTemp);
            NSString* detailTemp =comicBook[@"description"];
            if (detailTemp == (id)[NSNull null]|| detailTemp.length == 0){
                detailTemp = @"No details available";
            }
            NSLog(@ "The description is : %@", detailTemp);
            NSDictionary *jsonThumbnail = comicBook[@"thumbnail"];
            NSString *path = jsonThumbnail[@"path"];
            NSString *thumbnailExtension = jsonThumbnail[@"extension"];
            NSString *characterURL = [NSString stringWithFormat:@"%@/portrait_large.%@",path,thumbnailExtension];
            
            NSLog(@"Character URL: %@",characterURL);
           
            
            [characterArray  addObject: [[ComicData alloc] initWithName:titleTemp detail:detailTemp andImageURL:characterURL]];
            }
        
        
}
    @end



