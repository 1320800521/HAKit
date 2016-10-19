//
//  NotificationService.m
//  NotificationService
//
//  Created by 🐷 on 16/10/17.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "NotificationService.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface NotificationService ()<UNNotificationContentExtension>

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    // Modify the notification content here...
    self.bestAttemptContent.title = [NSString stringWithFormat:@"%@ [modified]", self.bestAttemptContent.title];
    
    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    self.contentHandler(self.bestAttemptContent);
}

- (UNNotificationContentExtensionMediaPlayPauseButtonType)mediaPlayPauseButtonType{
    return UNNotificationContentExtensionMediaPlayPauseButtonTypeDefault;
}

- (CGRect)mediaPlayPauseButtonFrame{
    return CGRectMake(100, 100, 100, 100);
}

- (UIColor *)mediaPlayPauseButtonTintColor{
    return [UIColor blueColor];
}

- (void)mediaPlayP{
    NSLog(@"播放");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.extensionContext mediaPlayingPaused];
        
        [self mediaPlay];
    });

}

- (void)mediaPauseP{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //        [self.extensionContext mediaPlayingPaused];
        
        [self mediaPause];
    });
}

- (void)mediaPlayingStarted{
    NSLog(@"主动调用开始的方法");
}
- (void)mediaPlayingPaused
{
    NSLog(@"主动调用暂停的方法");
    
}


@end
