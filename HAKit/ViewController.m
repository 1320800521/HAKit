//
//  ViewController.m
//  HAKit
//
//  Created by 🐷 on 16/8/2.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreLocation/CoreLocation.h>
#import "SpeechTestViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArray = [NSArray arrayWithObjects:@"电话管理",@"iOS 仿知乎/途家导航栏渐变文字动画效果",@"safair语音",@"语音合成",@"指纹解锁", nil];
    
    self.title = @"功能";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *mytable = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [mytable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    mytable.dataSource = self;
    mytable.delegate = self;
    mytable.rowHeight = 50;
    [self.view addSubview:mytable];
    
    
    // 1.本地通知
    [self requestLocationNotification];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
        
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            SpeechTestViewController *speechVC = [[SpeechTestViewController alloc]init];
            [self.navigationController pushViewController:speechVC animated:YES];
        }
            break;
        case 4:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- 推送测试


- (void)requestLocationNotification{
    
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"徐不同测试通知";
    content.subtitle = @"测试通知";
    content.body = @"来自徐不同的简书";
    content.badge = @1;
    
    NSError *error = nil;
    
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"icon_certification_status1@2x" ofType:@"png"];/****** *******
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"gif"];
    //     *******/
    NSString *path = [[NSBundle mainBundle] pathForResource:@"flv视频测试用例1" ofType:@"mp4"];

    //    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    /* 附件通知键值使用说明*/
    // 1.UNNotificationAttachmentOptionsTypeHintKey
    //    dict[UNNotificationAttachmentOptionsTypeHintKey] = (__bridge id _Nullable)(kUTTypeImage);
    
    // 2.UNNotificationAttachmentOptionsThumbnailHiddenKey
    //    dict[UNNotificationAttachmentOptionsThumbnailHiddenKey] =  @YES;
    
    // 3.UNNotificationAttachmentOptionsThumbnailClippingRectKey
    //    dict[UNNotificationAttachmentOptionsThumbnailClippingRectKey] = (__bridge id _Nullable)((CGRectCreateDictionaryRepresentation(CGRectMake(0, 0, 1 ,1))));
    //    Rect对应的意思
    //    thumbnailClippingRect =     {
    //        Height = "0.1";
    //        Width = "0.1";
    //        X = 0;
    //        Y = 0;
    //    };
    //   4. UNNotificationAttachmentOptionsThumbnailTimeKey-选取影片的某一秒做推送显示的缩略图
    //    dict[UNNotificationAttachmentOptionsThumbnailTimeKey] =@10;
    
    
    
    UNNotificationAttachment *att = [UNNotificationAttachment attachmentWithIdentifier:@"att1" URL:[NSURL fileURLWithPath:path] options:nil error:&error];
    if (error) {
        NSLog(@"attachment error %@", error);
    }
    content.attachments = @[att];
    content.launchImageName = @"icon_certification_status1@2x.png";
    
    //这里设置category1， 是与之前设置的category对应
    content.categoryIdentifier = @"category1";
    
    UNNotificationSound *sound = [UNNotificationSound defaultSound];
    content.sound = sound;
    
    /*触发模式1*/
    UNTimeIntervalNotificationTrigger *trigger1 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2 repeats:NO];
    
    /*触发模式2*/
//    UNTimeIntervalNotificationTrigger *trigger2 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
    
    /*触发模式3*/
    // 周一早上 8：00 上班
//    NSDateComponents *components = [[NSDateComponents alloc] init];
//    // 注意，weekday是从周日开始的，如果想设置为从周一开始，大家可以自己想想~
//    components.weekday = 2;
//    components.hour = 8;
//    UNCalendarNotificationTrigger *trigger3 = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
    
    
    /*触发模式4 这个方法一般要先#import<CoreLocation/CoreLocation.h>*/
    
    /*这个触发条件一般在
     //1、如果用户进入或者走出某个区域会调用下面两个方法
     - (void)locationManager:(CLLocationManager *)manager
     didEnterRegion:(CLRegion *)region
     - (void)locationManager:(CLLocationManager *)manager
     didExitRegion:(CLRegion *)region代理方法反馈相关信息
     */
//    
//    CLRegion *region = [[CLRegion alloc] init];
//    CLCircularRegion *circlarRegin = [[CLCircularRegion alloc] init];
//    
    
    
    
    // 创建本地通知
    NSString *requestIdentifer = @"TestRequestww1";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifer content:content trigger:trigger1];
    
    //把通知加到UNUserNotificationCenter, 到指定触发点会被触发
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
    }];
    
    
}


@end
