//
//  FirstViewController.m
//  ComicBook
//
//  Created by Azizur Rahman on 2016-10-23.
//  Copyright © 2016 letscodes. All rights reserved.
//

#import "ListViewController.h"


@interface ListViewController ()

@end



@implementation ListViewController
    
   // NSArray *characters;
    NSString *detailSequeIdentifier =@"ShowDetailSegue";

- (void)viewDidLoad {
    _tableView.dataSource = self;
     [super viewDidLoad];
    if ([ComicData getCharacters] == nil){
    [self getCharactersFromMarvel];
        NSLog(@"Downloading .....");
    }
    
   
    
   
    
   // characters =[ComicCharacter getCharacters];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self getCharactersFromMarvel];
    // Dispose of any resources that can be recreated.
}
    
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[ComicData getCharacters] count];
}
    
    
    
    
    -(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        static NSString *cellIdentifier=@"TableCell";
        AppTableViewCell *cell =(AppTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell==nil){
            cell = [[AppTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        [cell updateUI:[[ComicData getCharacters] objectAtIndex:[indexPath row]]];
        
        return cell;
        
        
    }

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    ComicData* comicData = [[ComicData getCharacters] objectAtIndex:[indexPath row]];
     if ([[segue identifier] isEqualToString:detailSequeIdentifier]){
        DetailViewController * detailVC =(DetailViewController*) [segue destinationViewController];
        detailVC.comicData = comicData;
        NSLog(@"%@", comicData);
   }
}
    
    
    -(void) getCharactersFromMarvel {
 
        MarvelServer *server = [MarvelServer sharedInstance];
        server.delegate = self;
        [server doGet:server.MARVEL_API_URL];
    }
    
#pragma mark MarvelServer Delegate Methods
    
    - (void)handleServerSuccess:(NSDictionary *)data {
      //  NSLog(@" Server Raw Response %@", data);
        
        if ([data[@"status"] isEqualToString:@"Ok"]) {
            [ComicData parsedJSONData:data[@"data"]];
            
        }
        else {
            NSLog(@"Credential : %@", data[@"code"]);
            NSLog(@"Message : %@", data[@"message"]);
          
            
            
          
        }
        
        
        NSArray *tempArray = [ComicData getCharacters];
        for(int i=0; i<[tempArray count]; i++){
           
           [[[ImageDownload alloc] init] downloadImage:[[tempArray objectAtIndex:i] imageURL] withComicDataIndex:i];
        }
    }
    
    - (void)handleServerError:(NSString *)error {
        NSLog(@"The error is :%@",error);
    }


    

    

@end
