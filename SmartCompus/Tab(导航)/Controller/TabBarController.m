//
//  TabBarController.m
//  智慧校园
//
//  Created by doushuyao on 2017/9/7.
//  Copyright © 2017年 opooc. All rights reserved.
//

#import "TabBarController.h"
#import "DSYMainViewController.h"
#import "DSYMeVC.h"
#import "DSYtalkVc.h"
#import "DSYCourseVC.h"
#import "UIImage+UIImage_imageOriginal.h"


@interface TabBarController ()

@end

@implementation TabBarController


// 只会调用一次
+ (void)load
{
    // 获取哪个类中UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 设置按钮选中标题的颜色:富文本:描述一个文字颜色,字体,阴影,空心,图文混排
    // 创建一个描述文本属性的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1 添加子控制器(4个子控制器) -> 自定义控制器 -> 划分项目文件结构
    [self setupAllChildViewController];
    
    // 2 设置tabBar上按钮内容 -> 由对应的子控制器的tabBarItem属性
    [self setupAllTitleButton];
    
    self.navigationItem.hidesBackButton = YES;
    
    
}
-(void)setupAllChildViewController{

    DSYMainViewController* main = [[DSYMainViewController alloc]init];
   // UINavigationController* nav1 = [[UINavigationController alloc]initWithRootViewController:main];
    [self addChildViewController:main];
    
    DSYCourseVC* course = [[DSYCourseVC alloc]init];
   // UINavigationController* nav2 = [[UINavigationController alloc]initWithRootViewController:wait];
    [self addChildViewController:course];
    
    DSYtalkVc* chat = [[DSYtalkVc alloc]init];
   // UINavigationController* nav3 = [[UINavigationController alloc]initWithRootViewController:setting];
    [self addChildViewController:chat];
    
    DSYMeVC* me = [[DSYMeVC alloc]init];
   // UINavigationController* nav4 = [[UINavigationController alloc]initWithRootViewController:achieve];
    [self addChildViewController:me];
    
}
- (void)setupAllTitleButton
{
    // 0:nav
    UINavigationController *nav = self.childViewControllers[0];
    nav.tabBarItem.title = @"首页";
    nav.tabBarItem.image = [UIImage imageNamed:@"main"];
    // 快速生成一个没有渲染图片
    nav.tabBarItem.selectedImage = [UIImage imageNamed:@"mainp"];
    

    UINavigationController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title = @"考勤";
    nav1.tabBarItem.image = [UIImage imageNamed:@"course"];
    nav1.tabBarItem.selectedImage = [UIImage imageNamed:@"coursep"];
    
    
    UINavigationController *nav2 = self.childViewControllers[2];
    nav2.tabBarItem.title = @"聊天";
    nav2.tabBarItem.image = [UIImage imageNamed:@"chat"];
    nav2.tabBarItem.selectedImage = [UIImage imageNamed:@"chatp"];
    
    // 3.我
    UINavigationController *nav4 = self.childViewControllers[3];
    nav4.tabBarItem.title = @"我的";
    nav4.tabBarItem.image = [UIImage imageNamed:@"me"];
    nav4.tabBarItem.selectedImage =  [UIImage imageNamed:@"mep"];
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
