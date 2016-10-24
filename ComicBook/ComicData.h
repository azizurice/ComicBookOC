//
//  ComicData.h
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-24.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ComicData : NSObject{

    
}
    
    
    @property NSString *title;
    @property NSString *detail;
    @property NSString *imageURL;
    @property UIImage *image;
    

    
-(id) initWithName:(NSString*)title detail:(NSString*) detail andImageURL:(NSString*) imageURL;
    
+(void) parsedJSONData:(NSDictionary*) jsonData;
    
+(NSArray* ) getCharacters;
    
    
    
@end
