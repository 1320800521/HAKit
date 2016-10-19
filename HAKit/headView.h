//
//  headView.h
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface headView : UIView<UIGestureRecognizerDelegate>

- (id)initWithFrame:(CGRect)frame;

/**
 *  圆点
 */
@property (nonatomic,strong) UIImageView *myDoutImgView;
/**
 *  地点
 */
@property (nonatomic,strong) UILabel *myAddLabel;
/**
 *  人数
 */
@property (nonatomic,strong) UILabel *myCountLabel;
/**
 *  圆点
 */
@property (nonatomic,strong) UIButton *myArrowBtn;

@property (nonatomic,copy) void (^clicked)(void);

@end
