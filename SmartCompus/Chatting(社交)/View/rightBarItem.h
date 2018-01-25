//
//  rightBarItem.h
//  8-25
//
//  Created by xlx on 16/8/26.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rightMenuView.h"


@class mainMapViewController;


@interface rightBarItem : UIBarButtonItem


@property (nonatomic, weak) mainMapViewController *controllerTarget;

-(id)initRightItemWithTarget:(mainMapViewController *)target;

-(void)hideMenu;

@end
