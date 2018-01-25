//
//  avatarCell.m
//  8-25
//
//  Created by xlx on 16/8/26.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "avatarCell.h"
#import "DSYDefines.h"

@implementation avatarCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self initUI];
    
    return self;
}
/**
 *  初始化UI
 */
-(void)initUI{
    _avatar = [[UIImageView alloc]initWithFrame:CGRectMake(15, 80, 70, 70)];
    _avatar.layer.cornerRadius = 35;
    _avatar.layer.masksToBounds = true;
    _avatar.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _avatar.layer.borderWidth = 1;
    _avatar.contentMode = UIViewContentModeScaleAspectFill;
    _avatar.image = [UIImage imageNamed:@"defaultAvatar"];
    [self.contentView addSubview:_avatar];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_avatar.frame)+10, CGRectGetMinY(_avatar.frame)+23, SCREEN_WIDTH*0.5-CGRectGetWidth(_avatar.frame)-10, 20)];
    _nameLabel.textColor = [UIColor grayColor];
    _nameLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_nameLabel];
}

@end
