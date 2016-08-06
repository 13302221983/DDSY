//
//  UIBalanceViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIBalanceViewController.h"
#import "Masonry.h"
#import "MdStyle.h"
#import "UIRechargeViewController.h"
#import "UIConsumerViewController.h"

@interface UIBalanceViewController ()

@end

@implementation UIBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    self.title = @"帐户余额";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSNumber *topHeight = [NSNumber numberWithInteger:400];
    
    UIView *topBkgView = [[UIView alloc] init];
    topBkgView.backgroundColor = [UIColor colorWithRed:245/255.0 green:49/255.0 blue:48/255.0 alpha:1.0];
    [self.view addSubview:topBkgView];
    [topBkgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(topHeight);
    }];
    
    //image
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor whiteColor];
    [topBkgView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topBkgView);
        make.top.equalTo(topBkgView).offset(80);
        make.size.mas_equalTo(CGSizeMake(150, 150));
    }];
    
    //余额
    UILabel *balanceLabel = [[UILabel alloc] init];
    [balanceLabel setText:@"12,950.00"];
    [balanceLabel setTextColor:[UIColor whiteColor]];
    [balanceLabel setFont:[UIFont boldSystemFontOfSize:36]];
    balanceLabel.textAlignment = NSTextAlignmentCenter;
    balanceLabel.numberOfLines = 1;
    [topBkgView addSubview:balanceLabel];
    [balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom).offset(20);
        make.left.equalTo(topBkgView);
        make.right.equalTo(topBkgView);
        make.height.mas_equalTo(@30);
    }];
    
    //
    UILabel *rechargeLabel = [[UILabel alloc] init];
    [rechargeLabel setText:@"累计充值\n21,000.00"];
    [rechargeLabel setTextColor:[UIColor blackColor]];
    [rechargeLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [rechargeLabel setBackgroundColor:[UIColor colorWithRed:237/255.0 green:101/255.0 blue:101/255.0 alpha:1.0]];
    rechargeLabel.textAlignment = NSTextAlignmentCenter;
    rechargeLabel.numberOfLines = 2;
    [topBkgView addSubview:rechargeLabel];
    [rechargeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(balanceLabel.mas_bottom).offset(20);
        make.bottom.mas_equalTo(topBkgView).offset(-10);
        make.left.mas_equalTo(@10);
        make.width.mas_equalTo(topBkgView.mas_width).multipliedBy(0.5).offset(-15);
    }];
    
    UILabel *consumerLabel = [[UILabel alloc] init];
    [consumerLabel setText:@"累计消费\n8,050.00"];
    [consumerLabel setTextColor:[UIColor blackColor]];
    [consumerLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [consumerLabel setBackgroundColor:[UIColor colorWithRed:237/255.0 green:101/255.0 blue:101/255.0 alpha:1.0]];
    consumerLabel.textAlignment = NSTextAlignmentCenter;
    consumerLabel.numberOfLines = 2;
    [topBkgView addSubview:consumerLabel];
    [consumerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rechargeLabel);
        make.bottom.equalTo(rechargeLabel);
        make.left.mas_equalTo(rechargeLabel.mas_right).offset(10);
        make.width.equalTo(rechargeLabel);
    }];
    
    UIButton *rechargeHistBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rechargeHistBtn setTitle:@"充值明细" forState:UIControlStateNormal];
    [rechargeHistBtn setTitleColor:[MdColor defaultColor].contentColor forState:UIControlStateNormal];
    [rechargeHistBtn.titleLabel setFont:[MdFont defaultFont].contentFont];
    rechargeHistBtn.layer.borderWidth = 1;
    rechargeHistBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    rechargeHistBtn.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:255/255.0 alpha:1.0];
    [rechargeHistBtn addTarget:self action:@selector(onRechargeHistoryBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rechargeHistBtn];
    [rechargeHistBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(topBkgView.mas_bottom).offset(10);
        make.width.mas_equalTo(topBkgView).multipliedBy(0.5).offset(-15);
        make.height.mas_equalTo(@60);
    }];
    
    UIButton *consumerHistBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [consumerHistBtn setTitle:@"消费明细" forState:UIControlStateNormal];
    [consumerHistBtn setTitleColor:[MdColor defaultColor].contentColor forState:UIControlStateNormal];
    [consumerHistBtn.titleLabel setFont:[MdFont defaultFont].contentFont];
    consumerHistBtn.layer.borderWidth = 1;
    consumerHistBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    consumerHistBtn.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:255/255.0 alpha:1.0];
    [consumerHistBtn addTarget:self action:@selector(onConsumerHistoryBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:consumerHistBtn];
    [consumerHistBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(rechargeHistBtn.mas_right).offset(10);
        make.top.equalTo(rechargeHistBtn);
        make.width.equalTo(rechargeHistBtn);
        make.height.equalTo(rechargeHistBtn);
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

- (void)onRechargeHistoryBtn:(id)sender
{
    UIRechargeViewController *vc = [[UIRechargeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)onConsumerHistoryBtn:(id)sender
{
    UIConsumerViewController *vc = [[UIConsumerViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
