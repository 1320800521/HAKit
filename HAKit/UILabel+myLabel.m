

//
//  UILabel+myLabel.m
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "UILabel+myLabel.h"

@implementation UILabel (myLabel)

+ (UILabel *)createLableWithFrame:(CGRect)rect text:(NSString *)text fontSize:(CGFloat)size rowSpace:(CGFloat)space textColor:(UIColor *)color{
    UILabel * lable = [[UILabel alloc] initWithFrame:rect];
    lable.font = [UIFont systemFontOfSize:size];
    lable.userInteractionEnabled = YES;
    lable.numberOfLines = 0;
    lable.text = text;
    lable.textColor = color;
    if (text) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = space;// 字体的行间距
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:14],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        lable.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    
    return lable;
}

+(UILabel *)addLineWifthFrime:(CGRect)rect{
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.backgroundColor = [UIColor grayColor];
    return label;
}

@end
