//
//  UIModalViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIModalViewController.h"

@interface UIModalViewController ()

@end

@implementation UIModalViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //top view
    self.topView = [[UIView alloc] init];
    self.topView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(@64);
    }];
    
    //menus
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setTitle:@"back" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[MdColor defaultColor].naviButtonColor forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [self.backButton.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [self.backButton addTarget:self action:@selector(onBackButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(20+7));
        make.left.mas_equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    //right button
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[MdColor defaultColor].naviButtonColor forState:UIControlStateNormal];
    [self.rightButton.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [self.rightButton addTarget:self action:@selector(onRightButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.topView);
        make.right.equalTo(self.topView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    [self.titleLabel setFont:[MdFont defaultFont].titleFont];
    [self.titleLabel setText:self.title?self.title:@""];
    [self.titleLabel setTextColor:[MdColor defaultColor].titleColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 1;
    [self.topView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.backButton.mas_right).offset(4);
        make.right.mas_equalTo(self.rightButton.mas_left).offset(-4);
        make.top.equalTo(self.topView).offset(20);
        make.bottom.equalTo(self.topView);
    }];
    
    
    //content view
    self.contentView = [[UIView alloc] init];
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.mas_equalTo(self.topView.mas_bottom);
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

- (void)onBackButtonEvent:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onRightButtonEvent:(id)sender
{
    
}
@end
