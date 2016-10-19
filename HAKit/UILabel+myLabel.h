//
//  UILabel+myLabel.h
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (myLabel)

+ (UILabel *)createLableWithFrame:(CGRect)rect text:(NSString *)text fontSize:(CGFloat)size rowSpace:(CGFloat)space textColor:(UIColor *)color;

/**
 *  创建分割线
 */
+(UILabel *)addLineWifthFrime:(CGRect)rect;
@end
