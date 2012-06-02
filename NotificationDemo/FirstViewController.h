//
//  FirstViewController.h
//  NotificationDemo
//
//  Created by 俞 億 on 12-6-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController{
    IBOutlet UITextField *contentField;
}
-(IBAction)sendButtonClick:(id)sender;
@end
