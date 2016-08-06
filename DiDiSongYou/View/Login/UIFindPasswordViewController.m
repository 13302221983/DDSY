//
//  UIFindPasswordViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/3/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIFindPasswordViewController.h"
#import "Masonry.h"
#import "UITipView.h"

@interface UIFindPasswordViewController ()

@end

@implementation UIFindPasswordViewController

- (void)viewDidLoad {
    
    self.title = @"找回密码";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *bkgView = [[UIView alloc] init];
    bkgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bkgView];
    [bkgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).offset(30);
        make.size.mas_equalTo(CGSizeMake(300, 400));
    }];
    
    //手机号码
    UITextField *mobileTextField = [self textFieldWithLeftTip:@"手机号码: " withPlaceholder:@"请输入手机号码"];
    [bkgView addSubview:mobileTextField];
    [mobileTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@0);
        make.right.mas_equalTo(@0).offset(-80);
        make.top.mas_equalTo(@0);
        make.height.mas_equalTo(@30);
    }];
    UIButton *getVerifyCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [getVerifyCodeBtn setTitle:@"获取验证码 " forState:UIControlStateNormal];
    [getVerifyCodeBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
    [getVerifyCodeBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [getVerifyCodeBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];

    [getVerifyCodeBtn addTarget:self action:@selector(onGetVerifyCodeBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [bkgView addSubview:getVerifyCodeBtn];
    [getVerifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mobileTextField.mas_right).offset(1);
        make.right.mas_equalTo(@0);
        make.top.equalTo(mobileTextField);
        make.height.equalTo(mobileTextField);
    }];
    
    //验证码
    UITextField *verifyTextField = [self textFieldWithLeftTip:@"验证码: " withPlaceholder:@"请输入验证码"];
    [bkgView addSubview:verifyTextField];
    [verifyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mobileTextField);
        make.right.equalTo(mobileTextField);
        make.top.mas_equalTo(mobileTextField.mas_bottom).offset(10);
        make.height.equalTo(mobileTextField);
    }];

    //输入新密码
    UITextField *passwordTextField = [self textFieldWithLeftTip:@"输入新密码: " withPlaceholder:@"请输入新密码"];
    [bkgView addSubview:passwordTextField];
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mobileTextField);
        make.right.equalTo(mobileTextField);
        make.top.mas_equalTo(verifyTextField.mas_bottom).offset(10);
        make.height.equalTo(mobileTextField);
    }];
    //确认新密码
    UITextField *confirmTextField = [self textFieldWithLeftTip:@"确认新密码: " withPlaceholder:@"请输入确认密码"];
    [bkgView addSubview:confirmTextField];
    [confirmTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mobileTextField);
        make.right.equalTo(mobileTextField);
        make.top.mas_equalTo(passwordTextField.mas_bottom).offset(10);
        make.height.equalTo(mobileTextField);
    }];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(onSubmitBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [submitBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
    [submitBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [submitBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
    [bkgView addSubview:submitBtn];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@0);
        make.right.mas_equalTo(@0);
        make.top.mas_equalTo(confirmTextField.mas_bottom).offset(10);
        make.height.equalTo(mobileTextField);
    }];
}

- (UITextField*)textFieldWithLeftTip:(NSString*)tip withPlaceholder:(NSString*)placeholder
{
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 76, 26)];
    [tipLabel setFont:[MdFont defaultFont].contentFont];
    [tipLabel setTextColor:[MdColor defaultColor].contentColor];
    [tipLabel setText:tip];
    tipLabel.textAlignment = NSTextAlignmentRight;
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.leftView = tipLabel;
    textField.leftViewMode = UITextFieldViewModeAlways;
//    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    [textField setFont:[MdFont defaultFont].contentFont];
    [textField setTextColor:[MdColor defaultColor].contentColor];
    return textField;
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

- (void)onGetVerifyCodeBtnEvent:(id)sender
{
    
}

- (void)onSubmitBtnEvent:(id)sender
{
    [UITipView showTip:@"密码修改成功！"];
}

@end
