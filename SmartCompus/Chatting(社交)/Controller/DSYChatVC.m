//
//  DSYChatVC.m
//  SmartCompus
//
//  Created by doushuyao on 2018/1/19.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "DSYChatVC.h"
#import <RongIMKit/RongIMKit.h>
#import "DSYtalkVc.h"
#import "rightBarItem.h"
#import "Info.h"


@interface DSYChatVC ()<rightMenuViewDelegate>
@property(nonatomic,strong)NSString* token;
@end

@implementation DSYChatVC{
    rightBarItem* rightBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];


    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 setTitle:@"发送" forState:UIControlStateNormal ];
    [btn2 setTitle: @"ooo" forState:UIControlStateHighlighted];
    btn2.frame = CGRectMake(100, 250, 100, 100);
    [btn2 addTarget:self action:@selector(fasong) forControlEvents:UIControlEventTouchUpInside];;
    [self.view addSubview:btn2];
    [self fasong];
    
    
}
-(void)fasong{
    DSYtalkVc* talk = [[DSYtalkVc alloc]init];
    [self.navigationController pushViewController:talk animated:YES];
    
}

-(void)woaini{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
