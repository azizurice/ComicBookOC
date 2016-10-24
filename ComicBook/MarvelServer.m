//
//  MarvelServer.m
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import "MarvelServer.h"

@interface MarvelServer ()

@end

@implementation MarvelServer
    
    @synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    
#pragma mark Singleton Methods
    static MarvelServer *sharedMarvelServer = nil;
    
+ (instancetype)sharedInstance {
    if(sharedMarvelServer==nil){
        sharedMarvelServer = [[self alloc] init];
        
    }
    return sharedMarvelServer;
}
    
    
- (instancetype)init {
    self = [super init];
    if (self) {
        
      //  static let APIBaseURL1 = "https://gateway.marvel.com/v1/public/comics?ts=17&apikey=c30573ac063f8a33b1de98dffc550caf&hash=7f2feb587bc9e1e5353669b50619baaf&limit=2";
        
        NSString* parameters = @"ts=17&apikey=c30573ac063f8a33b1de98dffc550caf&hash=7f2feb587bc9e1e5353669b50619baaf&limit=2";
        
         _BASE_URL = @"https://gateway.marvel.com/v1/public/comics?%@";
         _MARVEL_API_URL = [NSURL URLWithString:[NSString stringWithFormat:self.BASE_URL, parameters]];

    }
    return self;
}
    
- (void)doGet:(NSURL *)url {
    NSLog(@"Server GET: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self loadAsyncTask:request withHandler:[self requestCompletionBlock:url]];
    
}
    
 
-(AsyncReturnBlock) requestCompletionBlock:(NSURL *)url{
    return ^ void (NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            [delegate handleServerError:[NSString stringWithFormat:@"%@", error]];
        }
        else {
            NSError *parseError = nil;
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            
            
            if (parseError != nil) {
                [delegate handleServerError:[NSString stringWithFormat:@"%@", parseError]];
            }
            else {
                [delegate handleServerSuccess:response];
            }
        }
    };
}
    
- (void) loadAsyncTask:(NSURLRequest *)request withHandler:(AsyncReturnBlock)handler{
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:handler] resume];
}
    
    
    
    @end
