//
//  ComicCharacter.h
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComicCharacter : NSObject{

}
    @property NSString *title;
    @property NSString *detail;
    @property NSString *imageName;
    
    -(id) initWithName:(NSString*)title detail:(NSString*) detail andImageName:(NSString*) imageName;
    
    
    +(NSArray* ) getCharacters;
    

@end
