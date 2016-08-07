//
//  UILoginViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 5/20/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UILoginViewController.h"
#import "Masonry.h"
#import "UIHomeViewController.h"
#import "UIFindPasswordViewController.h"
#import "MdStyle.h"
#import "Ints.h"

@interface UILoginViewController ()

@end

@implementation UILoginViewController{
    UITextField *_accountTextField;
    UITextField *_passwordTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    
    UIView *loginView = [self loginView];
    [self.view addSubview:loginView];
    
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(self.view).offset(-30);
        make.top.mas_equalTo(20+44+30);
        make.height.mas_equalTo(320);
    }];

    
    UIButton *passwordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [passwordButton.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [passwordButton setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
    [passwordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [passwordButton addTarget:self action:@selector(onGetPasswordEvent:) forControlEvents:UIControlEventTouchUpInside];
    [passwordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:passwordButton];
    [passwordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(loginView);
        make.top.mas_equalTo(loginView.mas_bottom).offset(100);
        make.size.mas_equalTo(CGSizeMake(80, 26));
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

- (UIView*)loginView{

    UIView *loginFrameView = [[UIView alloc] init];

    //logo view
    UIImageView *logoView = [[UIImageView alloc] init];
    [logoView setBackgroundColor:[UIColor whiteColor]];
    UIImage *logoImage = [UIImage imageNamed:@"loginLogo"];
    [logoView setImage:logoImage];
    [loginFrameView addSubview:logoView];
    
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.equalTo(loginFrameView);
        make.size.mas_equalTo(CGSizeMake(150, 150));
    }];
    
    

    //account view
    //account logo
    UIImageView *accountLogoView = [[UIImageView alloc] init];
    UIImage *accountLogoImage = [UIImage imageNamed:@"user.png"];
    [accountLogoView setImage:accountLogoImage];

    accountLogoView.frame = CGRectMake(4, 4, 26, 26);
    
    _accountTextField = [[UITextField alloc] init];
    _accountTextField.placeholder = @"帐号";
    _accountTextField.text = @"gzOper";
    _accountTextField.layer.borderWidth = 1;
    _accountTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _accountTextField.leftView = accountLogoView;
    _accountTextField.leftViewMode = UITextFieldViewModeAlways;
    [_accountTextField setTextColor:[MdColor defaultColor].contentColor];
    [_accountTextField setFont:[MdFont defaultFont].contentFont];
    [loginFrameView addSubview:_accountTextField];
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logoView.mas_bottom).offset(40);
        make.left.mas_equalTo(loginFrameView);
        make.right.mas_equalTo(loginFrameView);
        make.height.mas_equalTo(32);
    }];

    //password view
    UIButton *showPasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [showPasswordBtn setBackgroundImage:[UIImage imageNamed:@"显示密码.png"] forState:UIControlStateNormal];
    showPasswordBtn.frame = CGRectMake(0, 0, 25, 25);
    [showPasswordBtn addTarget:self action:@selector(onShowPasswordBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *passwordLogoView = [[UIImageView alloc] init];
    UIImage *passwordLogoImage = [UIImage imageNamed:@"pwd.png"];
    [passwordLogoView setImage:passwordLogoImage];

    passwordLogoView.frame = CGRectMake(4, 4, 26, 26);
    
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.placeholder = @"密码";
    _passwordTextField.text = @"QAZxsw123";
    _passwordTextField.layer.borderWidth = 1;
    _passwordTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _passwordTextField.leftView = passwordLogoView;
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    _passwordTextField.rightView = showPasswordBtn;
    _passwordTextField.rightViewMode = UITextFieldViewModeAlways;
    [_passwordTextField setTextColor:[MdColor defaultColor].contentColor];
    [_passwordTextField setFont:[MdFont defaultFont].contentFont];
    _passwordTextField.secureTextEntry = YES;
    [loginFrameView addSubview:_passwordTextField];
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_accountTextField.mas_bottom).offset(10);
        make.left.mas_equalTo(_accountTextField);
        make.right.mas_equalTo(_accountTextField);
        make.height.mas_equalTo(_accountTextField);
    }];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];

    [loginButton.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [loginButton setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
    
    [loginFrameView addSubview:loginButton];
    [loginButton addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];
    [loginFrameView addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTextField.mas_bottom).offset(10);
        make.left.mas_equalTo(_accountTextField);
        make.right.mas_equalTo(_accountTextField);
        make.height.mas_equalTo(_accountTextField);
    }];
    
    return loginFrameView;
}

- (void)loginEvent:(id)sender
{
    [Ints loginAccount:_accountTextField.text password:_passwordTextField.text block:nil];
    UIHomeViewController *homeView = [[UIHomeViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:homeView];
    [self presentViewController:navi animated:YES completion:nil];
}


- (void)onGetPasswordEvent:(id)sender
{
    UIFindPasswordViewController *findPasswordVC = [[UIFindPasswordViewController alloc] init];
    [self presentViewController:findPasswordVC animated:YES completion:nil];
}

- (void)onShowPasswordBtnEvent:(id)sender
{
    _passwordTextField.secureTextEntry = !_passwordTextField.secureTextEntry;
}
@end
