//
//  CallKitTestViewController.m
//  HAKit
//
//  Created by 🐷 on 16/10/14.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "CallKitTestViewController.h"
#pragma mark 电话拦截
#import <CallKit/CallKit.h>

@interface CallKitTestViewController ()<UITextFieldDelegate>
{
    UITextField *noTextField;
    UIWebView *callWebview;
}


@end

@implementation CallKitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    noTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 50, 100, 20)];
    noTextField.layer.borderWidth = 1;
    noTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    noTextField.layer.masksToBounds = YES;
    noTextField.layer.cornerRadius = 5;
    noTextField.placeholder = @"INPUT!!!!!!";
    noTextField.returnKeyType = UIReturnKeyDone;
    noTextField.delegate = self;
    [self.view addSubview:noTextField];
    
    UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    checkBtn.frame = CGRectMake((self.view.frame.size.width-100)/2, noTextField.frame.size.height+noTextField.frame.origin.y+50, 100, 20);
    [checkBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [checkBtn setTitle:@"检查权限" forState:UIControlStateNormal];
    [checkBtn addTarget:self action:@selector(checkPermissions:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkBtn];
    
    UIButton *updateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    updateBtn.frame = CGRectMake((self.view.frame.size.width-100)/2, checkBtn.frame.size.height+checkBtn.frame.origin.y+50, 100, 20);
    [updateBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [updateBtn setTitle:@"更新数据" forState:UIControlStateNormal];
    [updateBtn addTarget:self action:@selector(updateData:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:updateBtn];
    
    UIButton *callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    callBtn.frame = CGRectMake((self.view.frame.size.width-100)/2, updateBtn.frame.size.height+updateBtn.frame.origin.y+50, 100, 20);
    [callBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [callBtn setTitle:@"打电话" forState:UIControlStateNormal];
    [callBtn addTarget:self action:@selector(makePhoneCall:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:callBtn];
    
    callWebview = [[UIWebView alloc] init];
    

}

-(void)makePhoneCall:(UIButton *)sender
{
    //sms：或者是sms://:发送短信；
    //tel： 或者是tel://:打电话
    //telprompt:或者是 telprompt://: 打电话；
    //mailto:发送邮件；
    //http：或者是 http://: 浏览网址；
    
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",noTextField.text];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    if (!callWebview.subviews) {
        [self.view addSubview:callWebview];
    }
}

-(void)checkPermissions:(UIButton *)sender
{
    CXCallDirectoryManager *manager = [CXCallDirectoryManager sharedInstance];
    // 获取权限状态
    [manager getEnabledStatusForExtensionWithIdentifier:@"com.omcn.PCallKitDemo.PCallKitDemo-EX" completionHandler:^(CXCallDirectoryEnabledStatus enabledStatus, NSError * _Nullable error) {
        if (!error) {
            NSString *title = nil;
            if (enabledStatus == CXCallDirectoryEnabledStatusDisabled) {
                /*
                 CXCallDirectoryEnabledStatusUnknown = 0,
                 CXCallDirectoryEnabledStatusDisabled = 1,
                 CXCallDirectoryEnabledStatusEnabled = 2,
                 */
                title = @"未授权，请在设置->电话授权相关权限";
            }else if (enabledStatus == CXCallDirectoryEnabledStatusEnabled) {
                title = @"授权";
            }else if (enabledStatus == CXCallDirectoryEnabledStatusUnknown) {
                title = @"不知道";
            }
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                           message:title
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                           message:@"有错误"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

-(void)updateData:(UIButton *)sender
{
    CXCallDirectoryManager *manager = [CXCallDirectoryManager sharedInstance];
    [manager reloadExtensionWithIdentifier:@"com.omcn.PCallKitDemo.PCallKitDemo-EX" completionHandler:^(NSError * _Nullable error) {
        if (error == nil) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                           message:@"更新成功"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                           message:@"更新失败"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
