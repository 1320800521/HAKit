//
//  UIColor+myColor.h
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (myColor)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end
