//
//  UIAccountInfoViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIAccountInfoViewController.h"
#import "Masonry.h"
#import "UIMyAccountTableViewCell.h"
#import "MdStyle.h"
#import "LocalData.h"

@interface UIAccountInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation UIAccountInfoViewController{
    UITableView *_tableView;
    NSArray *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"帐户信息";
    
    _dataArray = [self accountInfo];
    
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

- (NSArray*)accountInfo{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    MdAccountInfo *info = [LocalData shareLocalData].myAccountInfo;
    NSString *value = [NSString stringWithFormat:@"会员姓名：%@", info.name];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"性别：%@", info.sex];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"民族：%@", info.nation];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"户籍所在地：%@", info.domicilePlace];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"出生日期：%@", info.birthday];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"身份证：%@", info.identity];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"通讯地址：%@", info.address];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"固定电话：%@", info.telephone];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"移动电话：%@", info.mobile];
    [array addObject:value];
 
    value = [NSString stringWithFormat:@"紧急联系人：%@", info.emergencyCotact];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"紧急联系人电话：%@", info.emergencyPhone];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"会员帐号：%@", info.account];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"会员等级：%@", info.level];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"登记场所：%@", info.registPlace];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"登记车辆数：%ld", (long)info.carCount];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"登记日期：%@", info.registDate];
    [array addObject:value];
    
    value = [NSString stringWithFormat:@"批准日期：%@", info.approvalDate];
    [array addObject:value];
    
    return  array;
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
    return 40;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIMyAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UIMyAccountInfoTableViewCell"];
    if (nil == cell) {
        cell = [[UIMyAccountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UIMyAccountInfoTableViewCell"];
    }
    
    NSString *text = [_dataArray objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:text];
    [cell.textLabel setFont:[MdFont defaultFont].contentFont];
    [cell.textLabel setTextColor:[MdColor defaultColor].contentColor];
    
    
    return cell;
}
@end
