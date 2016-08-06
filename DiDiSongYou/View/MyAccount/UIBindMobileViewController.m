//
//  UIBindMobileViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/18/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIBindMobileViewController.h"
#import "Masonry.h"
#import "MdStyle.h"
#import "UITipView.h"


@interface UIBindMobileViewController ()

@end

@implementation UIBindMobileViewController{
    UITextField *mobileTextField;
    UITextField *verifyTextField;
    UITextField *newPasswordTextField;
    UITextField *confirmPaaswordTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改绑定手机";
    self.view.backgroundColor = [UIColor whiteColor];
    //原绑定号码
    UITextField *textField1;
    UILabel* label = [self inputViewWithTip:@"原绑定号码：" withTextField:&textField1 refTop:nil];
    mobileTextField = textField1;
    
    UILabel *tipLabel = [[UILabel alloc] init];
    [tipLabel setText:@"原绑定手机137XXXX5526，请输入完整号码后获取短信难码。该手机已停止使用？通过客服人员改绑定手机。"];
    [tipLabel setTextAlignment:NSTextAlignmentLeft];
    [tipLabel setTextColor:[MdColor defaultColor].contentColor];
    [tipLabel setFont:[MdFont defaultFont].contentFont];
    tipLabel.numberOfLines = 0;
    [self.view addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(8);
        make.left.equalTo(label);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(@60);
    }];
    
    UITextField *textField2;
    UILabel *verify = [self inputViewWithTip:@"验证码：" withTextField:&textField2 refTop:tipLabel];
    verifyTextField = textField2;
    UIButton *getVerifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [getVerifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getVerifyBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
    [getVerifyBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [getVerifyBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
    [self.view addSubview:getVerifyBtn];
    [getVerifyBtn addTarget:self action:@selector(getVerifyBtnEVent:) forControlEvents:UIControlEventTouchUpInside];
    [getVerifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(verify);
        make.left.mas_equalTo(verifyTextField.mas_right).offset(4);
        make.width.mas_equalTo(@80);
        make.height.equalTo(verify);
    }];

    
    UITextField *textField3;
    UILabel *newMobile = [self inputViewWithTip:@"新绑定号码：" withTextField:&textField3 refTop:verify];
    newPasswordTextField  = textField3;
    
    UITextField *textField4;
    UILabel *confirm = [self inputViewWithTip:@"确认新号码：" withTextField:&textField4 refTop:newMobile];
    confirmPaaswordTextField = textField4;
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
    [submitBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [submitBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
    [self.view addSubview:submitBtn];
    [submitBtn addTarget:self action:@selector(submitBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(confirm.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(@150);
        make.height.mas_equalTo(@30);
    }];

}

- (UILabel*)inputViewWithTip:(NSString*)tip withTextField:(UITextField**)textField refTop:(UIView*)refView{
    UILabel *label = [[UILabel alloc] init];
    [label setText:tip];
    [label setTextAlignment:NSTextAlignmentRight];
    [label setTextColor:[MdColor defaultColor].contentColor];
    [label setFont:[MdFont defaultFont].contentFont];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        if (refView) {
            make.top.mas_equalTo(refView.mas_bottom).offset(8);
        }else{
            make.top.equalTo(self.view).offset(44+20+30);
        }
        make.width.mas_equalTo(@90);
        make.height.mas_equalTo(@26);
    }];
    
    *textField = [[UITextField alloc] init];
    UITextField *tmpTextField = *textField;
    tmpTextField.layer.borderWidth  = 1;
    tmpTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [*textField setFont:[MdFont defaultFont].contentFont];
    [*textField setTextColor:[MdColor defaultColor].contentColor];

    [self.view addSubview:*textField];
    [*textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(label.mas_right);
        make.top.equalTo(label);
        make.bottom.equalTo(label);
        make.width.mas_equalTo(@130);
    }];
    
    return label;
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

/**
 *  获取验证码咱就事件
 *
 *  @param sender 事件触发对象
 */
- (void)getVerifyBtnEVent:(id)sender
{
    
}


- (void)submitBtnEvent:(id)sender
{
    [UITipView showTip:@"绑定手机修改成功！"];
}
@end
