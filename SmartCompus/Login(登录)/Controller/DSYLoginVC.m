//
//  DSYLoginVC.m
//  Daoleme
//
//  Created by doushuyao on 2018/1/18.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "DSYLoginVC.h"
#import "DSYDefines.h"

@interface DSYLoginVC ()

@end

@implementation DSYLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* portraitImageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth*0.5 - 50, 100, 100, 100)];
    portraitImageV.contentMode = UIViewContentModeScaleAspectFit;
    portraitImageV.clipsToBounds = YES;
    portraitImageV.layer.cornerRadius = 50;
    portraitImageV.layer.borderWidth = 1;
    portraitImageV.layer.borderColor = [[UIColor blueColor]CGColor];
    [portraitImageV.layer masksToBounds];
    UIImage* protraitImage = [UIImage imageNamed:@"logo.png"];
    portraitImageV.image = protraitImage;
    
    
    [self.view addSubview:portraitImageV];
    
    
    UIView* center = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(portraitImageV.frame)+80, ScreenWidth, 200)];
   
    [self.view addSubview:center];
    
    UIImageView* accounti = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 40, 40)];
    accounti.image = [UIImage imageNamed:@"account"];
    [center addSubview:accounti];
    UITextField* accountt  =  [[UITextField alloc] initWithFrame:CGRectMake(80, 10, ScreenWidth -80, 40)];
    accountt.placeholder = @"请输入账户名";
    accountt.font = [UIFont systemFontOfSize:15];
    accountt.textColor = placeholderColor;
    accountt.textAlignment = 0 ;
    [center addSubview:accountt];
    
    UIView* placeline = [[UIView alloc]initWithFrame:CGRectMake(20, 60, ScreenWidth -80, 2)];
    placeline.backgroundColor =placeholderColor;
    [center addSubview:placeline];
    
    
    UIImageView* passwordi = [[UIImageView alloc]initWithFrame:CGRectMake(20, 60, 40, 40)];
    passwordi.image = [UIImage imageNamed:@"password"];
    [center addSubview:passwordi];
    
    
    UITextField* password  =  [[UITextField alloc] initWithFrame:CGRectMake(80, 60, ScreenWidth -80, 40)];
    password.placeholder = @"请输入密码";
    password.font = [UIFont systemFontOfSize:15];
    password.textColor = placeholderColor;
    password.textAlignment = 0 ;
    [center addSubview:password];
    
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame =CGRectMake(20, CGRectGetMaxY(password.frame), ScreenWidth-40, 80);
    loginBtn.layer.cornerRadius = 1;
    [loginBtn.layer masksToBounds];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateHighlighted];
    
    loginBtn.backgroundColor = [UIColor colorWithRed:119 green:197 blue:245 alpha:1];
    [center addSubview:loginBtn];
    
 
    
    
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
