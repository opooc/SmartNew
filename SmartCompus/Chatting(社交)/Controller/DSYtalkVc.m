//
//  DSYtalkVc.m
//  SmartCompus
//
//  Created by doushuyao on 2018/1/19.
//  Copyright © 2018年 opooc. All rights reserved.
//
#import "Info.h"
#import "DSYtalkVc.h"

@interface DSYtalkVc ()
@property(nonatomic,strong)NSString* token;
@end

@implementation DSYtalkVc

- (void)viewDidLoad {
    [super viewDidLoad];
    //右拉
    
    NSString* phoneTok  =  [[Info sharedInstance]getUser];
    
    
    if ([phoneTok  isEqual: @"13070797333"]) {
        _token = @"OimsXkJsSgmisghyHn3hpBE5MGlqjwPYX4ecrtcVl3X1jD0WGlV9H6Iof+6X7un1XHWWfqczx1xFealEMzKtT/b34EuEQM6d"  ;
    }
    else if ([phoneTok  isEqual:@"17853728811"]){
        _token = @"GzQYx2xSDyiSc+KtgnQVXX5UOTw4B5f6Xvc7g7bPWgNmoBfuxW6HRSOsdrxMGMqsPBt/uetgoVe2oeHAXQxGsw==";
    }
    else{
        UIAlertController* alco = [UIAlertController alertControllerWithTitle:@"提示" message:@"oh，该账号非测试账号,该功能无法使用" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* alertac = [UIAlertAction  actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alco addAction:alertac];
        UIAlertAction* alertac2 = [UIAlertAction actionWithTitle:@"只能确定" style:UIAlertActionStyleDefault handler:nil];
        [alco addAction:alertac2];
        [self presentViewController:alco animated:YES completion:^{
            
        }];
    }
    [[RCIM sharedRCIM] connectWithToken:_token    success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%dinfo", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    
    
    
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
}
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = @"高级机密谈话";
    [self.navigationController pushViewController:conversationVC animated:YES];
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
