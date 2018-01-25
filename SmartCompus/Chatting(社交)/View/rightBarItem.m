//
//  rightBarItem.m
//  8-25
//
//  Created by xlx on 16/8/26.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "rightBarItem.h"
#import "DSYDefines.h"
#import "UIView+DSYUIView_ex.h"
@implementation rightBarItem
{
    UIWindow *window;
    UIView *layView;
    
    rightMenuView *rightMenu;
}
-(id)initRightItemWithTarget:(mainMapViewController *)target{
    self = [super initWithImage:[UIImage imageNamed:@"toolbar-0480"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
    _controllerTarget = target;
    [self initUI];
    
    rightMenu.delegate = _controllerTarget;
    
    return self;
}
/**
 *  初始化UI
 *
 */
-(void)initUI{
    window = [UIApplication sharedApplication].keyWindow;
    layView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    layView.alpha = 0;
    layView.backgroundColor = [UIColor blackColor];
    [window addSubview:layView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMenu)];
    [layView addGestureRecognizer:tap];
    
    rightMenu = [[rightMenuView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH*0.5, SCREEN_HEIGHT)];
    [window addSubview:rightMenu];
    rightMenu.hidden = true;
}

/**
 *  点击右上角按钮
 */
-(void)clickRightItem{
    [self showMenu];
}
/**
 *  显示菜单栏
 *
 */
-(void)showMenu{
    rightMenu.hidden = false;
    [UIView animateWithDuration:0.2 animations:^{
        layView.alpha = 0.2;
        
        [rightMenu moveToX:SCREEN_WIDTH-SCREEN_WIDTH*0.5];
    }];
}
/**
 * 隐藏菜单栏
 */
-(void)hideMenu{
    [UIView animateWithDuration:0.2 animations:^{
        layView.alpha = 0;
    
        [rightMenu moveToX:SCREEN_WIDTH];
        
    } completion:^(BOOL finished) {
        rightMenu.hidden = true;
    }];
}

@end











