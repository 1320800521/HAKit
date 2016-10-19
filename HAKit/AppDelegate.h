//
//  AppDelegate.h
//  HAKit
//
//  Created by 🐷 on 16/8/2.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

