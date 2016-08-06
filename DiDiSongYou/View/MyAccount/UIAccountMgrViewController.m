//
//  UIAccountMgrViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIAccountMgrViewController.h"
#import "Masonry.h"
#import "MdStyle.h"
#import "UIFindPasswordViewController.h"
#import "UIMyAccountTableViewCell.h"
#import "UIFindPasswordViewController.h"
#import "UIBindMobileViewController.h"

@interface UIAccountMgrViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation UIAccountMgrViewController{
    NSArray *_menuArray;
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"我的帐户";
    self.view.backgroundColor = [UIColor redColor];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"accountsafe" ofType:@".plist"];
    _menuArray = [NSArray arrayWithContentsOfFile:file];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
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
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menuArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UIPwdMgrTableViewCell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UIPwdMgrTableViewCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *msgDict = [_menuArray objectAtIndex:indexPath.row];
    NSString *text = [msgDict objectForKey:@"name"];
    NSInteger tag = [[msgDict objectForKey:@"tag"] integerValue];
    
    [cell.textLabel setText:text];
    [cell.textLabel setFont:[MdFont defaultFont].contentFont];
    [cell.textLabel setTextColor:[MdColor defaultColor].contentColor];
    cell.tag = tag;
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIFindPasswordViewController * vc = [[UIFindPasswordViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (1 == indexPath.row){
        UIBindMobileViewController *vc = [[UIBindMobileViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
