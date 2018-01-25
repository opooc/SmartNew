//
//  MeController.m
//  iOSClientOfQFNU
//
//  Created by doushuyao on 18/1/21.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "DSYMeVC.h"
#import "meTableViewCell.h"
#import "meTableHeadView.h"
#import "Info.h"
#import "DSYDefines.h"
#import <UShareUI/UShareUI.h>


@interface DSYMeVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DSYMeVC
{
    UITableView *_tableView;
    
    NSArray *dataSource;
    
    meTableHeadView *head;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
/**
 *  初始化UI
 */
-(void)initUI{
    
    
    
    
    
    
    
    //
    self.automaticallyAdjustsScrollViewInsets = false;
    
    // self.navigationController.navigationBar.subviews[0].alpha = 0;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray* mutdataSource;
    mutdataSource = [[NSMutableArray alloc]init];
    NSString*num = [[Info sharedInstance]getUser];
    
    [mutdataSource addObject:@{@"title":@"签到",@"date":num}];
    [mutdataSource addObject:@{@"title":@"签到",@"date":@"+1"}];
    [mutdataSource addObject:@{@"title":@"签到",@"date":@"+1"}];
    dataSource = mutdataSource;
    
    
    //,@{@"title":@"姓名",@"date":_name},@{@"title":@"校区",@"date":_campus},@{@"title":@"院系",@"date":_faculty},@{@"title":@"专业",@"date":_profession},@{@"title":@"班级",@"date":_clazz}
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.layer.masksToBounds = false;
    
    _tableView.estimatedRowHeight = 80;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    //表示tableViewCell 动态返回
    
    //    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    //    footView.backgroundColor = [UIColor blueColor];
    //    _tableView.tableFooterView = footView;      //去除多余的横线
    
    _tableView.tableFooterView = [[UIView alloc]init];
    
    
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"meTableViewCell" bundle:nil] forCellReuseIdentifier:@"mainCell"];
    
    
    head = [[meTableHeadView alloc]init];
    _tableView.tableHeaderView = head;
    
    [head.share addTarget:self action:@selector(UshareUI) forControlEvents:UIControlEventTouchUpInside];
  
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = dataSource[indexPath.row];
    meTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    cell.dataSource = dict;
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = _tableView.contentOffset.y;
    //CGFloat Alpha = offset/(SCREEN_WIDTH/4*3);
    //self.navigationController.navigationBar.subviews[0].alpha = Alpha;
    
    if (offset<0) {
        head.bg.frame = CGRectMake(0, -64+offset, SCREEN_WIDTH, SCREEN_WIDTH/4*3-offset);
    }
    
    
}


/**
 *  分割线顶头
 */
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [_tableView setSeparatorInset:UIEdgeInsetsZero];
    
    [_tableView setLayoutMargins:UIEdgeInsetsZero];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

-(void)UshareUI{
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_Sina),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_Sms)]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        if(platformType == UMSocialPlatformType_Sina){
            
            [self shareTextToPlatformType:platformType];
        }
        else{
            
            [self shareWebPageToPlatformType:platformType];}
        
    }];
    
}
//友盟分享
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = @"SMARP";
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}


- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"智慧校园" descr:@"智慧校园App是由追梦人开发,志于帮助同学们更加便捷的体验校园生活。。" thumImage:[UIImage imageNamed:@"114x114logo.png"]];
    //设置网页地址
    shareObject.webpageUrl =@"http://qfnu.opooc.com";
    //分享消息对象设置分享内容对象
    
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}



@end

