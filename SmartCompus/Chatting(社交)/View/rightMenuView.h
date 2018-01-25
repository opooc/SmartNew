//
//  rightMenuView.h
//  8-25
//
//  Created by xlx on 16/8/26.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol rightMenuViewDelegate <NSObject>


-(void)modalToLogin;

@end


@interface rightMenuView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;


@property (nonatomic, weak) id<rightMenuViewDelegate>delegate;

@end
