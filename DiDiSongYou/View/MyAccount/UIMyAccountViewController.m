//
//  UIMyAccountViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIMyAccountViewController.h"
#import "Masonry.h"
#import "MdStyle.h"
#import "UIMyAccountTableViewCell.h"
#import "UIAccountInfoViewController.h"
#import "UIBalanceViewController.h"
#import "UIAccountMgrViewController.h"
#import "UIFeedbackViewController.h"
#import "UIAboutViewController.h"

typedef NS_ENUM(NSInteger, MYACCOUNT_MENU) {
    MYACCOUNT_MENU_ACCOUNTINFO = 1,
    MYACCOUNT_MENU_BALANCE = 2,
    MYACCOUNT_MENU_SAFE = 3,
    MYACCOUNT_MENU_FEEDBACK = 4,
    MYACCOUNT_MENU_ABOUT = 5,
    MYACCOUNT_MENU_LOGOUT = 6,
};

@interface UIMyAccountViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation UIMyAccountViewController{
    NSArray *_menuArray;
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"我的帐户";
    self.view.backgroundColor = [UIColor redColor];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"MyAccountMenu" ofType:@".plist"];
    _menuArray = [NSArray arrayWithContentsOfFile:file];
    
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
    UIMyAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UIMyAccountTableViewCell"];
    if (nil == cell) {
        cell = [[UIMyAccountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UIMyAccountTableViewCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *msgDict = [_menuArray objectAtIndex:indexPath.row];
    NSString *text = [msgDict objectForKey:@"name"];
    NSString *imageName = [msgDict objectForKey:@"image"];
    NSInteger tag = [[msgDict objectForKey:@"tag"] integerValue];
    
    [cell.textLabel setText:text];
    [cell.textLabel setFont:[MdFont defaultFont].contentFont];
    [cell.textLabel setTextColor:[MdColor defaultColor].contentColor];
    [cell.imageView setImage:[UIImage imageNamed:imageName]];
    cell.tag = tag;
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    switch (cell.tag) {
        case MYACCOUNT_MENU_ACCOUNTINFO:{
            UIAccountInfoViewController *vc = [[UIAccountInfoViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case MYACCOUNT_MENU_BALANCE:{
            UIBalanceViewController *vc = [[UIBalanceViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case MYACCOUNT_MENU_SAFE:{
            UIAccountMgrViewController *vc = [[UIAccountMgrViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case MYACCOUNT_MENU_FEEDBACK:{
            UIFeedbackViewController *vc = [[UIFeedbackViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case MYACCOUNT_MENU_ABOUT:{
            UIAboutViewController *vc = [[UIAboutViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case MYACCOUNT_MENU_LOGOUT:
        {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        default:
            break;
    }

}
@end
