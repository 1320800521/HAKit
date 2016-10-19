//
//  UILabel+myLabel.m
//  HAKit
//
//  Created by 🐷 on 16/8/3.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "UILabel+myLabel.h"
#define WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation UILabel (myLabel)


-(CGFloat)getSpaceLabelHeight:(NSString*)str  withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 0;//行间距 默认为0
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.0f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

-(UILabel *)LableWithFrame:(CGRect)frame font:(CGFloat)font text:(NSString *)text limitedToNumberOfLines:(NSInteger)limitedToNumberOfLines aligment:(NSTextAlignment)aligment lineBreakMode:(NSLineBreakMode)lineBreakMode{

    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.frame = frame;
    label.font = [UIFont systemFontOfSize:font];
    label.text = text;
    label.textAlignment = aligment;
    return label;
}



@end
