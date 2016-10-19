//
//  CallDirectoryHandler.m
//  Tell_Message
//
//  Created by 🐷 on 16/10/13.
//  Copyright © 2016年 🐷. All rights reserved.
//

// 拦截号码或者号码标识的情况下,号码必须要加国标区号
#import "CallDirectoryHandler.h"

@interface CallDirectoryHandler () <CXCallDirectoryExtensionContextDelegate>
@end

@implementation CallDirectoryHandler

//开始请求的方法，在打开设置-电话-来电阻止与身份识别开关时，系统自动调用
- (void)beginRequestWithExtensionContext:(CXCallDirectoryExtensionContext *)context {
    context.delegate = self;

    if (![self addBlockingPhoneNumbersToContext:context]) {
        NSLog(@"Unable to add blocking phone numbers");
        NSError *error = [NSError errorWithDomain:@"CallDirectoryHandler" code:1 userInfo:nil];
        [context cancelRequestWithError:error];
        return;
    }
    
    if (![self addIdentificationPhoneNumbersToContext:context]) {
        NSLog(@"Unable to add identification phone numbers");
        NSError *error = [NSError errorWithDomain:@"CallDirectoryHandler" code:2 userInfo:nil];
        [context cancelRequestWithError:error];
        return;
    }
    
    [context completeRequestWithCompletionHandler:nil];
}

//添加黑名单：根据生产的模板，只需要修改CXCallDirectoryPhoneNumber数组，数组内号码要按升序排列
- (BOOL)addBlockingPhoneNumbersToContext:(CXCallDirectoryExtensionContext *)context {
    // Retrieve phone numbers to block from data store. For optimal performance and memory usage when there are many phone numbers,
    // consider only loading a subset of numbers at a given time and using autorelease pool(s) to release objects allocated during each batch of numbers which are loaded.
    //
    // Numbers must be provided in numerically ascending order.
    CXCallDirectoryPhoneNumber phoneNumbers[] = { 14085555555, 18005555555 };
    NSUInteger count = (sizeof(phoneNumbers) / sizeof(CXCallDirectoryPhoneNumber));

    for (NSUInteger index = 0; index < count; index += 1) {
        CXCallDirectoryPhoneNumber phoneNumber = phoneNumbers[index];
        [context addBlockingEntryWithNextSequentialPhoneNumber:phoneNumber];
    }

    return YES;
}

// 添加信息标识：需要修改CXCallDirectoryPhoneNumber数组和对应的标识数组；CXCallDirectoryPhoneNumber数组存放的号码和标识数组存放的标识要一一对应，CXCallDirectoryPhoneNumber数组内的号码要按升序排列
- (BOOL)addIdentificationPhoneNumbersToContext:(CXCallDirectoryExtensionContext *)context {
    // Retrieve phone numbers to identify and their identification labels from data store. For optimal performance and memory usage when there are many phone numbers,
    // consider only loading a subset of numbers at a given time and using autorelease pool(s) to release objects allocated during each batch of numbers which are loaded.
    //
    // Numbers must be provided in numerically ascending order.
    CXCallDirectoryPhoneNumber phoneNumbers[] = { 8618775555555, 8615210124764 };
    NSArray<NSString *> *labels = @[ @"二货", @"逗逼" ];
    NSUInteger count = (sizeof(phoneNumbers) / sizeof(CXCallDirectoryPhoneNumber));

    for (NSUInteger i = 0; i < count; i += 1) {
        CXCallDirectoryPhoneNumber phoneNumber = phoneNumbers[i];
        NSString *label = labels[i];
        [context addIdentificationEntryWithNextSequentialPhoneNumber:phoneNumber label:label];
    }

    return YES;
}

#pragma mark - CXCallDirectoryExtensionContextDelegate

- (void)requestFailedForExtensionContext:(CXCallDirectoryExtensionContext *)extensionContext withError:(NSError *)error {
    // An error occurred while adding blocking or identification entries, check the NSError for details.
    // For Call Directory error codes, see the CXErrorCodeCallDirectoryManagerError enum in <CallKit/CXError.h>.
    //
    // This may be used to store the error details in a location accessible by the extension's containing app, so that the
    // app may be notified about errors which occured while loading data even if the request to load data was initiated by
    // the user in Settings instead of via the app itself.
}

@end
