//
//  UIAddOilConfirmViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIAddOilConfirmViewController.h"
#import "Masonry.h"
#import "MdStyle.h"
#import "UIMyAccountTableViewCell.h"


@interface UIAddOilConfirmViewController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation UIAddOilConfirmViewController{
    NSMutableArray *_dataArray;
    UITableView *_orderTableView;
    
    NSString *_currentYP;
    
    NSMutableArray *_arrayYP;
}
- (id)init
{
    self = [super init];
    if (self) {
        self.dataDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"加油确认";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *address = [self.dataDict objectForKey:@"Location"];
    _dataArray = [[NSMutableArray alloc] init];
    [_dataArray addObject:[NSString stringWithFormat:@"车牌号码：%@", self.carInfo.number]];
    [_dataArray addObject:[NSString stringWithFormat:@"加油卡号：%@", self.carInfo.oilCard]];
    [_dataArray addObject:[NSString stringWithFormat:@"位置：%@", address]];
    [_dataArray addObject:@"油品：0#普通柴油（国III）"];
    [_dataArray addObject:@"会员单价：5.80"];
    _currentYP = @"油品：0#普通柴油（国III）";
    
    _orderTableView = [[UITableView alloc] init];
    _orderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _orderTableView.delegate = self;
    _orderTableView.dataSource = self;
    [self.view addSubview:_orderTableView];
    [_orderTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(@270);
    }];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"下单" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
    [submitBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
    submitBtn.layer.borderWidth = 1;
    submitBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [submitBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
    [submitBtn addTarget:self action:@selector(onSubmitEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(_orderTableView.mas_bottom).offset(10);
        make.width.mas_equalTo(@160);
        make.height.mas_equalTo(@36);
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

- (void)onSubmitEvent:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"订单已提交\n订单号：XXXXXX\n我们会尽快为您安排配送" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"油品：0#普通柴油（国III）",
        @"油品：0#普通柴油（国IV）",
        @"油品：0#普通柴油（国V）",
        nil];
        [array removeObject:_currentYP];
        _arrayYP =[NSMutableArray arrayWithArray:array];
        [_arrayYP insertObject:_currentYP atIndex:0];
        
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:_currentYP otherButtonTitles:nil,nil];
        for (NSString *item in array) {
            [sheet addButtonWithTitle:item];
        }
        [sheet showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( (buttonIndex-1) < [_arrayYP count] ) {
        _currentYP = [_arrayYP objectAtIndex:buttonIndex-1];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
        
        UITableViewCell *cell = [_orderTableView cellForRowAtIndexPath:indexPath];
        [cell.textLabel setText:_currentYP];
    }
}

#pragma mark -UITableViewDataSource;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIMyAccountTableViewCell *cell = (UIMyAccountTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"orderTableViewCell"];
    if (nil == cell) {
        cell = [[UIMyAccountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"orderTableViewCell"];
    }
    
    if(indexPath.row == 3)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    NSString *text = [_dataArray objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:text];
    [cell.textLabel setFont:[MdFont defaultFont].contentFont];
    [cell.textLabel setTextColor:[MdColor defaultColor].contentColor];
    
    return cell;
}


@end
