//
//  MessageWindow.m
//  NotificationDemo
//
//  Created by 俞 億 on 12-6-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MessageWindow.h"

@implementation MessageWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        messageArray = [[NSMutableArray alloc]init];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(messageReceived:) 
                                                    name:MessageSendNotification object:nil];
        
        self.windowLevel = UIWindowLevelAlert;
        self.userInteractionEnabled= YES;
        
        messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 0, 120, 20)];
        messageLabel.backgroundColor = [UIColor blackColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.textAlignment = UITextAlignmentCenter;
        messageLabel.font = [UIFont systemFontOfSize:13];
        messageLabel.hidden = YES;
        messageLabel.userInteractionEnabled = YES;
        [self addSubview:messageLabel];
        
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(keyboardWillShow:)
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    }
    return self;
}

- (void)dealloc
{
    [messageArray release];
    [messageLabel release];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MessageSendNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [super dealloc];
}

- (void)keyboardWillShow:(NSNotification *)notification 
{
    //NSLog(@"keyboardWillShow");
 	NSDictionary *userInfo = [notification userInfo];
    
    // Get animation info from userInfo
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    CGRect keyboardEndFrame;
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    NSLog(@"keyboardEndFrame:%@",NSStringFromCGRect(keyboardEndFrame));
}

-(void)messageReceived:(NSNotification*)notification{
    [messageArray addObject:[[notification userInfo]objectForKey:@"message"]];
    messageLabel.hidden = NO;
    messageLabel.text = [messageArray lastObject];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    if (CGRectContainsPoint(messageLabel.frame, [touch locationInView:self]) ) {
        [messageArray removeLastObject];
        if (messageArray.count>0) {
            messageLabel.text = [messageArray lastObject];
        }else {
            messageLabel.hidden = YES;
        }
    }
}
@end
