//
//  SecondViewController.h
//  NotificationDemo
//
//  Created by 俞 億 on 12-6-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *messageArray;
    IBOutlet UITableView *DataTable;
}
@end
