//
//  UIRechargeViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIRechargeViewController.h"
#import "Masonry.h"
#import "MdStyle.h"
#import "UIListViewCell.h"

@interface UIRechargeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation UIRechargeViewController{
    NSArray *_dataArray;
    UITableView *_tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"我的帐户";
    self.view.backgroundColor = [UIColor redColor];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"recharge" ofType:@".plist"];
    _dataArray = [NSArray arrayWithContentsOfFile:file];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIListViewCell *listViewCell = [[UIListViewCell alloc] init];
    [listViewCell setColumnCount:2];
    [listViewCell setColumnTitle:@"充值时间" withColumn:0];
    [listViewCell setColumnTitle:@"充值金额" withColumn:1];
    return listViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UIListViewCell"];
    if (nil == cell) {
        cell = [[UIListViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UIListViewCell"];
        [cell setColumnCount:2];
    }
    
    NSDictionary *msgDict = [_dataArray objectAtIndex:indexPath.row];
    NSString *text = [msgDict objectForKey:@"time"];
    NSString *value = [msgDict objectForKey:@"value"];
    
    [cell setColumnTitle:text withColumn:0];
    [cell setColumnTitle:value withColumn:1];
    
    
    return cell;
}

@end
