
//
//  headView.m
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "headView.h"
#import "UILabel+myLabel.h"
#import "UIColor+myColor.h"
//屏幕宽度 (单位：点)
#define kScreen_Width               [UIScreen mainScreen].bounds.size.width

/**
 左边距
 */

#define KLEFTSPACE 20

@implementation headView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configer:frame];
    }
    
    return self;
}

-(void)configer:(CGRect)frame{

    /**
     *  原点
     */
    UIImage *doutImg = [UIImage imageNamed:@"yuan"];
    self.myDoutImgView = [[UIImageView alloc]initWithImage:doutImg];
    self.myDoutImgView.frame = CGRectMake(KLEFTSPACE, 0, doutImg.size.width, doutImg.size.height);
    
    self.myDoutImgView.center = CGPointMake(self.myDoutImgView.center.x, frame.size.height / 2);
    
    /**
     *  地点
     */
    self.myAddLabel = [UILabel createLableWithFrame:CGRectMake(self.myDoutImgView.frame.origin.x + self.myDoutImgView.frame.size.width + 15, 0, frame.size.width / 3, frame.size.height / 4) text:@"贵阳" fontSize:15.0 rowSpace:0 textColor:[UIColor colorWithHexString:@"6c7e87"]];
    self.myAddLabel.center = CGPointMake(self.myAddLabel.center.x, frame.size.height / 2);
    self.myAddLabel.textAlignment = NSTextAlignmentLeft;
    
    /**
     *  箭头
     */
    UIImage *arrowImg = [UIImage imageNamed:@"xiabian"];
    //    self.myArrowImgView = [[UIButton alloc]initWithImage:arrowImg];
    self.myArrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.myArrowBtn setBackgroundImage:arrowImg forState:UIControlStateNormal];
    self.myArrowBtn.frame = CGRectMake(kScreen_Width - KLEFTSPACE - arrowImg.size.width, 0, arrowImg.size.width, arrowImg.size.height);
    self.myArrowBtn.backgroundColor = [UIColor redColor];
    [self.myArrowBtn addTarget:self action:@selector(open:) forControlEvents:UIControlEventTouchUpInside];
    self.myArrowBtn.center = CGPointMake(self.myArrowBtn.center.x, frame.size.height / 2);
    
    /**
     *  人数
     */
    self.myCountLabel = [UILabel createLableWithFrame:CGRectMake(self.myArrowBtn.frame.origin.x - kScreen_Width / 4, 0, frame.size.width / 3, frame.size.height / 4) text:@"3/5人" fontSize:15.0 rowSpace:0 textColor:[UIColor colorWithHexString:@"6c7e87"]];
    self.myCountLabel.center = CGPointMake(self.myCountLabel.center.x, frame.size.height / 2);
    self.myCountLabel.textAlignment = NSTextAlignmentRight;
    
    [self addSubview:self.myDoutImgView];
    [self addSubview:self.myAddLabel];
    [self addSubview:self.myArrowBtn];
    [self addSubview:self.myCountLabel];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGes:)];
    tapGes.delegate = self;
    [self addGestureRecognizer:tapGes];
    
    [self addSubview: [UILabel addLineWifthFrime:CGRectMake(0, frame.size.height - 1, frame.size.width, 1)]];

}

- (void)tapGes:(UITapGestureRecognizer *)tap{
    if (self.clicked) {
        
        self.myArrowBtn.backgroundColor = [UIColor blueColor];
        self.clicked();
        
        [self open:self.myArrowBtn];
    }
}

- (void)open:(UIButton *)btn{
    self.myArrowBtn.backgroundColor = [UIColor blueColor];

};

@end
