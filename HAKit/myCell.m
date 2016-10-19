
//
//  myCell.m
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "myCell.h"
#import "UIColor+myColor.h"
#import "UILabel+myLabel.h"
//屏幕宽度 (单位：点)
#define kScreen_Width               [UIScreen mainScreen].bounds.size.width
//屏幕高度（单位：点）
#define kScreen_Height              [UIScreen mainScreen].bounds.size.height

@implementation myCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

- (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    NSString *hexString = [NSString stringWithFormat:@"0x%@", stringToConvert];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [UIColor colorWithRGBHex:hexNum];
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifie{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifie];
    if (self) {
        self.selectionStyle = UITableViewStylePlain;
        
        // 总人数
        self.myTotolePerson = [UILabel createLableWithFrame:CGRectMake(20, 15, kScreen_Width / 4, self.frame.size.height - 30) text:@"总人数" fontSize:12 rowSpace:0 textColor:[UIColor colorWithHexString:@"fd7b7c"]];
        // 未上车
        self.myCarPerson = [UILabel createLableWithFrame:CGRectMake(20 + kScreen_Width / 4, 15, kScreen_Width / 4, self.frame.size.height - 30) text:@"未上车" fontSize:12 rowSpace:0 textColor:[UIColor colorWithHexString:@"fd7b7c"]];
        // 姓名
        self.myName = [UILabel createLableWithFrame:CGRectMake(20 + kScreen_Width / 2, 15, kScreen_Width / 4, self.frame.size.height - 30) text:@"姓名" fontSize:12 rowSpace:0 textColor:[UIColor colorWithHexString:@"d4e0e9"]];
        // 手机号
        self.myTel = [UILabel createLableWithFrame:CGRectMake(kScreen_Width - 20 - kScreen_Width / 4, 15, kScreen_Width / 4, self.frame.size.height - 30) text:@"手机号" fontSize:12 rowSpace:0 textColor:[UIColor colorWithHexString:@"d4e0e9"]];
        
        
        
        [self.contentView addSubview:self.myTotolePerson];
        [self.contentView addSubview:self.myCarPerson];
        [self.contentView addSubview:self.myName];
        [self.contentView addSubview:self.myTel];
        
    }
    return self;
}

- (void)setDcit:(NSDictionary *)dcit{
    
    self.myTotolePerson.text = dcit[@"count"];
    self.myCarPerson.text = dcit[@"car"];
    self.myName.text = dcit[@"name"];
    NSString *tellstr = dcit[@"tell"];
    self.myTel.text =  [tellstr stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
