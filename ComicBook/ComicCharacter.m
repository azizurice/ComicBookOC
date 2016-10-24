//
//  ComicCharacter.m
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import "ComicCharacter.h"

@implementation ComicCharacter
    
    -(id) initWithName:(NSString *)title detail:(NSString *)detail andImageName:(NSString *)imageName{
        self.title=title;
        self.detail =detail;
        self.imageName =imageName;
        return self;
    }
    
    +(NSArray*) getCharacters{
        NSMutableArray *characterArray = [[NSMutableArray alloc] init];
        for (int i=1; i<=10; i++) {
           ComicCharacter *cc= [[ComicCharacter alloc] initWithName:@"Title 1" detail:@"There is not detail" andImageName: [NSString stringWithFormat:@"%d",i]];
            [characterArray addObject:cc];
            NSLog(@"%d",i);
        }
 
    return characterArray;
    
    }
    
  @end
