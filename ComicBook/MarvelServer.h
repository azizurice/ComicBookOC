//
//  MarvelServer.h
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MarvelServer;

@protocol MarvelServerDelegate
 
- (void)handleServerSuccess:(NSDictionary *)data;
    
- (void)handleServerError:(NSString *)error;
    
@end

@interface MarvelServer : UIViewController {
    
}
    
    typedef void (^AsyncReturnBlock)(NSData *, NSURLResponse *, NSError *);
    

    @property (nonatomic, retain) id delegate;

    @property (readonly) NSString *BASE_URL;
    @property (readonly) NSURL *MARVEL_API_URL;
    

+ (instancetype)sharedInstance;
    
    
    
- (instancetype)init __attribute__((unavailable("Cannot use init for this class, use +(instanceType)sharedInstance instead!")));
    

- (void)doGet:(NSURL *) url;
    

- (AsyncReturnBlock) requestCompletionBlock :(NSURL *)url;
    

- (void) loadAsyncTask:(NSURLRequest *) request withHandler:(AsyncReturnBlock) handler;
    
    @end
