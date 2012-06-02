//
//  FirstViewController.m
//  NotificationDemo
//
//  Created by 俞 億 on 12-6-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)sendButtonClick:(id)sender{
    [contentField resignFirstResponder];
    NSDictionary *messageDic = [NSDictionary dictionaryWithObjectsAndKeys:contentField.text,@"message", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:MessageSendNotification
                                                       object:nil
                                                     userInfo:messageDic];
}
@end
