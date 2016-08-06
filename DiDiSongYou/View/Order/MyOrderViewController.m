//
//  MyOrderViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "MyOrderViewController.h"
#import "TestLoad.h"
#import "MdOrder.h"
#import "Masonry.h"
#import "UIOrderListTableViewCell.h"
#import "UIOrderDetailViewController.h"
#import "UITipView.h"
#import "Macro.h"

@interface MyOrderViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@end

@implementation MyOrderViewController{
    UITableView *_tableView;
    NSArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"我的订单";
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
    return 158;
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
    }
    
    MdOrder *order = [_dataArray objectAtIndex:indexPath.row];
    
    NSString *stateString = [NSString stringWithFormat:@"订单状态：%@", order.state];
    
    NSString *content = [NSString stringWithFormat:@"订单编号：%@\n会员车牌号：%@\n下单时间：%@\n通知时间：%@\n配送司机：%@\n联系电话：%@\n",
                         order.code,
                         order.car,
                         order.dateTime,
                         order.notifyTime,
                         order.driver,
                         order.mobile];
    
    [cell.textLabel setText:stateString];
    
    [cell.detailTextLabel setText:content];
    
    [cell.detailBtn addTarget:self action:@selector(onDetailBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.detailBtn.tag = indexPath.row;
    cell.cancelBtn.tag = indexPath.row;
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

- (void)onCancelBtn:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您确定要取消订单？" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    alertView.tag = btn.tag;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
        begin_run_background_thread{
            sleep(1);
            begin_run_main{
                MdOrder *order = [_dataArray objectAtIndex:alertView.tag];
                [UITipView showTip:[NSString stringWithFormat:@"您的订单已取消。\n订单号:%@", order.code] andStyle:1];
                NSMutableArray *array = [[NSMutableArray alloc] initWithArray:_dataArray];
                [array removeObject:order];
                _dataArray = array;
                [_tableView reloadData];
            }
            end_run_main;
        }
        end_run_background_thread;
    }
    
}
@end
