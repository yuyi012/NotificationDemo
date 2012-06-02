//
//  SecondViewController.m
//  NotificationDemo
//
//  Created by 俞 億 on 12-6-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        
        messageArray = [[NSMutableArray alloc]init];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(messageReceived:) 
                                                    name:MessageSendNotification object:nil];
    }
    return self;
}
			
- (void)dealloc
{
    [messageArray release];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MessageSendNotification object:nil];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}
     
-(void)messageReceived:(NSNotification*)notification{
    NSLog(@"dic:%@",[notification userInfo]);
    [messageArray addObject:[[notification userInfo]objectForKey:@"message"]];
    [DataTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *messageCell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
    if (messageCell==nil) {
        messageCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:@"messageCell"]autorelease];
    }
    messageCell.textLabel.text = [messageArray objectAtIndex:indexPath.row];
    return messageCell;
}
@end
