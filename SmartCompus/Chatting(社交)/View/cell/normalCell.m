//
//  normalCell.m
//  8-25
//
//  Created by xlx on 16/8/26.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "normalCell.h"
#import "DSYDefines.h"

@implementation normalCell


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
    _iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 20, 20)];
    [self.contentView addSubview:_iconImage];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_iconImage.frame)+10, CGRectGetMinY(_iconImage.frame),  - 20 - 10, 20)];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_titleLabel];

}


@end
