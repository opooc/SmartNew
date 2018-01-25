//
//  tableHeadView.m
//  iOSClientOfQFNU
//
//  Created by doushuyao on 17/6/12.
//  Copyright © 2017年 iOSClientOfQFNU. All rights reserved.
//

#import "meTableHeadView.h"
#import "headBtn.h"
#import "DSYPhotoHelper.h"
#import "LoginController.h"
#import "Info.h"
#import <UShareUI/UShareUI.h>
#import "DSYDefines.h"

@implementation meTableHeadView


-(instancetype)init{
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}


-(void)initUI{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/4*3-64);
    
    _bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_WIDTH/4*3)];
    _bg.image = [UIImage imageNamed:@"backImage"];
    _bg.contentMode = UIViewContentModeScaleAspectFill;
    _bg.layer.masksToBounds = true;
    [self addSubview:_bg];
    
    
    CGFloat Y = 35/736.0*SCREEN_HEIGHT;
    CGFloat offset = 15/736.0*SCREEN_HEIGHT;
    
    _portrait = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-90)/2, Y, 90, 90)];
    _portrait.image  = [UIImage imageNamed:@"114x114logo.png"];
    _portrait.layer.cornerRadius = 45;
    _portrait.layer.masksToBounds = true;
    _portrait.layer.borderColor = [[UIColor whiteColor] CGColor];
    _portrait.layer.borderWidth = 2;
    _portrait.userInteractionEnabled = YES;
    UITapGestureRecognizer* gas = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gas)];
    [_portrait addGestureRecognizer:gas];
    [self addSubview:_portrait];
    
    _name = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_portrait.frame)+offset, SCREEN_WIDTH, 20)];
    _name.textAlignment = NSTextAlignmentCenter;
    _name.textColor = [UIColor whiteColor];
    _name.font = [UIFont systemFontOfSize:17];
      NSString* phoneTok  =  [[Info sharedInstance]getUser];
    if ([phoneTok  isEqual: @"13070797333"]) {
        _name.text = @"Opooc";
    }
    else if ([phoneTok  isEqual:@"17853728811"]){
       _name.text = @"delaiwen";
    }
    
    
    [self addSubview:_name];
    
    _remindBtn = [[headBtn alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-110-10, CGRectGetMaxY(_name.frame)+offset, 110, 30)];
    [_remindBtn setImage:[UIImage imageNamed:@"Clock"] forState:0];
    [_remindBtn setTitle:@"退出" forState:0];
    [_remindBtn addTarget:self action:@selector(tuichu) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_remindBtn];
    
    
    _share = [[headBtn alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+10, CGRectGetMinY(_remindBtn.frame), 110, 30)];
    [_share setImage:[UIImage imageNamed:@"Share"] forState:0];
    [_share setTitle:@"分享" forState:0];

    [self addSubview:_share];
    

}
-(void)tuichu{
    LoginController* login = [[LoginController alloc]init];
    [[self View:self].navigationController pushViewController:login animated:YES];
    [[Info sharedInstance]save:@""];


}
- (UIViewController *)View:(UIView *)view{
    UIResponder *responder = view;
    //循环获取下一个响应者,直到响应者是一个UIViewController类的一个对象为止,然后返回该对象.
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}

-(void)gas{
    [[DSYPhotoHelper shareHelper]showImageViewSelcteWithResultBlock:^(id data) {
        _portrait.image = (UIImage*) data;
    }];

}

@end
