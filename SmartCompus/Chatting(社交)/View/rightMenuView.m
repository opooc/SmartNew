//
//  rightMenuView.m
//  8-25
//
//  Created by xlx on 16/8/26.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "rightMenuView.h"
#import "avatarCell.h"
#import "normalCell.h"

@implementation rightMenuView
{
    UITableView *_tableView;
    
    CGFloat selfWidth;
    CGFloat selfHeight;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    selfWidth = frame.size.width;
    selfHeight = frame.size.height;

    [self initUI];
    
    return self;
}
/**
 *  初始化UI
 */
-(void)initUI{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(-3, 0);
    self.layer.shadowRadius = 3;
    self.layer.shadowOpacity = 0.2;
    
    _dataSource = @[@"登陆/注册",@"个人中心",@"轨迹",@"轨迹图",@"设置"];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
    [_tableView registerClass:[avatarCell class] forCellReuseIdentifier:@"avatarCell"];
    [_tableView registerClass:[normalCell class] forCellReuseIdentifier:@"normalCell"];
    _tableView.tableFooterView = [UIView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess) name:@"loginSuccess" object:nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 180;
    }else{
        return 44;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        avatarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"avatarCell" forIndexPath:indexPath];
        cell.nameLabel.text = _dataSource[indexPath.row];
        
//        if ([XUser currentUser]) {
//            cell.nameLabel.text = [XUser currentUser].userName;
//        }
        return  cell;
    }else{
        normalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
//        cell.iconImage.image = [[UIImage imageNamed:[NSString stringWithFormat:@"normal%ld",indexPath.row]] imageWithColor:[UIColor grayColor]];
        cell.titleLabel.text = _dataSource[indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        if ([XUser currentUser]) {
//            
//        }else{
//            [_delegate modalToLogin];
//        }
    }
}
/**
 *  登陆成功
 */
-(void)loginSuccess{
    [_tableView reloadData];
}
@end








