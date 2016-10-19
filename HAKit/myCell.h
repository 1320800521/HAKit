//
//  myCell.h
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCell : UITableViewCell
/**
 *  人数
 */
@property (nonatomic,strong) UILabel *myTotolePerson;
/**
 *  未上车
 */
@property (nonatomic,strong) UILabel *myCarPerson;
/**
 *  姓名
 */
@property (nonatomic,strong) UILabel *myName;
/**
 *  手机号
 */
@property (nonatomic,strong) UILabel *myTel;

@property (nonatomic,strong) NSDictionary *dcit;

@end
