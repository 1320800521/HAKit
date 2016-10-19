//
//  TestView.h
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+myColor.h"

@interface TestView : UIView//<UITableViewDataSource,UITableViewDelegate>
/**
 *  列表
 */
@property (nonatomic,strong) UITableView *myTableView;
/**
 *  数据源
 */
@property (nonatomic,strong) NSArray *dataArray;

/**
 *  是否展开数据   YES：不展开 NO：展开
 */
@property (nonatomic,assign) BOOL isOpen;
/**
 *  点击的组数
 */
@property (nonatomic,assign) NSInteger section;

-(id)initWithFrame:(CGRect)frame;

@end
