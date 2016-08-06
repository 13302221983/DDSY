//
//  UIConsumerViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIConsumerViewController.h"

#import "TestLoad.h"
#import "MdOrder.h"
#import "Masonry.h"
#import "UIOrderListTableViewCell.h"
#import "UIOrderDetailViewController.h"
#import "UITipView.h"
#import "Macro.h"

@interface UIConsumerViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@end

@implementation UIConsumerViewController{
    UITableView *_tableView;
    NSArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"消费明细";
#ifdef TEST_VERSION
    _dataArray = [TestLoad OrderData];
#endif
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.allowsSelection = NO;
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIOrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UIMyMessageTableViewCell"];
    if (nil == cell) {
        cell = [[UIOrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UIMyMessageTableViewCell"];
        cell.cancelBtn.hidden = YES;
    }
    
    MdOrder *order = [_dataArray objectAtIndex:indexPath.row];
    
    NSString *stateString = [NSString stringWithFormat:@"订单状态：%@", order.state];
    
    NSString *content = [NSString stringWithFormat:@"会员车牌号：%@\n加油时间：%@\n消费金额：%@\n",
                         order.car,
                         order.dateTime,
                         order.money];
    
    [cell.textLabel setText:stateString];
    
    [cell.detailTextLabel setText:content];
    
    [cell.detailBtn addTarget:self action:@selector(onDetailBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.detailBtn.tag = indexPath.row;
    
    [cell.cancelBtn addTarget:self action:@selector(onCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}

- (void)onDetailBtn:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    NSInteger index = btn.tag;
    MdOrder *order = [_dataArray objectAtIndex:index];
    UIOrderDetailViewController *vc = [[UIOrderDetailViewController alloc] init];
    vc.order = order;
    [self.navigationController pushViewController:vc animated:YES];
}
@end

