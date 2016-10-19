//
//  TestView.m
//  HAKit
//
//  Created by 🐷 on 16/8/18.
//  Copyright © 2016年 🐷. All rights reserved.
//

#import "TestView.h"
//#import "MenuCell.h"
#import "myCell.h"
#import "headView.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame{
   self = [ super initWithFrame:frame];
    
    if (self) {
        
//        [self configer];
    }
    
    return self;
}


- (void)configer{

    self.section = 9999;
    
    NSDictionary *dict1 = @{@"count":@"3人",@"car":@"1人",@"name":@"小妹",@"tell":@"1111111111111"};
    NSArray *arr1 = [NSArray arrayWithObjects:dict1,dict1,dict1, nil];
    
    NSDictionary *dict2 = @{@"address":@"北京",@"count":@"8888/5人"};
    
    NSDictionary *dict3 = @{@"header":dict2,@"list":arr1};
    
    self.dataArray = [NSArray arrayWithObjects:dict3,dict3,dict3, nil];
    
    // 默认不展开
    self.isOpen = YES;
    self.myTableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    self.myTableView.backgroundColor = [UIColor clearColor];
    self.myTableView.rowHeight = 44;
    self.myTableView.sectionHeaderHeight = 44;
    self.myTableView.separatorInset = UIEdgeInsetsMake(0,0,0,0);
    self.myTableView.tableFooterView = [UIView new];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.myTableView setSeparatorColor:[UIColor grayColor]];
//    [self.myTableView registerClass:[MenuCell class] forCellReuseIdentifier:@"menu"];
    [self.myTableView registerClass:[myCell class] forCellReuseIdentifier:@"myCell"];
    [self addSubview:self.myTableView];
}


//- (void)openList:(NSInteger )section{
//    
//    [self.myTableView reloadData];
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    headView *header = [[headView alloc]initWithFrame:CGRectMake(0, 0,self.viewForLastBaselineLayout.frame.size.width, 44)];
//    
//    NSDictionary *dict = [self.dataArray[section] objectForKey:@"header"];
//    
//    
//    header.myAddLabel.text = dict[@"address"];
//    header.myCountLabel.text = dict[@"count"];
//    
//    __weak headView *weakhead = header;
//    header.clicked = ^{
//        if (self.section == section) {
//            self.section = 9999;
//            weakhead.myArrowBtn.backgroundColor = [UIColor redColor];
//        }else{
//            self.section = section;
//            
//            weakhead.myArrowBtn.backgroundColor = [UIColor blueColor];
//        }
//        
//        [self.myTableView reloadData];
//        
//        NSLog(@" ----------  %d",section);
//        
//    };
//    
//    
//    
//    return header;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    return [self.dataArray count];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    if (section == self.section) {
//        return [[self.dataArray[section] objectForKey:@"list"] count];
//    }else{
//        return 0;
//    }
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    NSArray *arr = [self.dataArray[indexPath.section] objectForKey:@"list"];
//    NSDictionary *dict = arr[indexPath.row];
//    
//    myCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
//    cell.dcit = dict;
//    
//    if (indexPath.row == 0) {
//        MenuCell *menuCell = [tableView dequeueReusableCellWithIdentifier:@"menu"];
//        return menuCell;
//    }else{
//        return cell;
//    }
//    
//    
//}
//
//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0) {
//        return NO;
//    }
//    return YES;
//}
//
//- (nullable NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (indexPath.row == 0) {
//        [tableView setEditing:NO animated:YES];
//        return nil;
//    }
//    
//    UITableViewRowAction * action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"打电话" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        [tableView setEditing:NO animated:YES];
//        NSLog(@"打电话");
//        //你可以在此分别添加按钮需要执行的动作
//    }];
//    
//    action1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dianhua"]];
//    
//    UITableViewRowAction * action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"action2" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSLog(@"click action2");
//    }];
//    action2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dianhua"]];
//    
//    UITableViewRowAction * action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"action3" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSLog(@"click action3");
//    }];
//    
//    return @[action1, action2, action3];
//}
@end
