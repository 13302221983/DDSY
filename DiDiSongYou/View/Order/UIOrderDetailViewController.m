//
//  UIOrderDetailViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIOrderDetailViewController.h"
#import "Masonry.h"

@interface UIOrderDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation UIOrderDetailViewController{
    UITableView *_tableView;
    NSArray *_dataArray;
}

@synthesize order;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"订单详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = [self dataFromOrder];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.allowsSelection = NO;
    UIView *footView = [[UIView alloc] init];
    footView.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = footView;
    
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

- (NSArray*)dataFromOrder
{
    NSMutableArray *array = [[NSMutableArray alloc] init];

    NSString *state = [NSString stringWithFormat:@"订单状态：%@", self.order.state];
    [array addObject:state];
    
    //会员帐号
    NSString *value = [NSString stringWithFormat:@"会员帐号：%@", @""];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"会员姓名：%@", @""];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"车牌号码：%@", self.order.car];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"加油卡号：%@", @""];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"订单编号：%@", self.order.code];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"油品：%@", @"0#普通柴油（国III）"];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"下单时间：%@", self.order.dateTime];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"通知时间：%@", self.order.notifyTime];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"加油时间：%@", @""];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"加油数量：%@", @"200L"];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"会员单价：%@", @"5.90"];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"配送司机：%@", self.order.driver];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"联系电话：%@", self.order.mobile];
    [array addObject:value];
    
    return array;
}



#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UIMyMessageTableViewCell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UIMyMessageTableViewCell"];
    }
    
    NSString *text = [_dataArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:text];
    
    return cell;
}

@end
