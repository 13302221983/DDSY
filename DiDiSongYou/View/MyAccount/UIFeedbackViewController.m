//
//  UIFeedbackViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/18/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIFeedbackViewController.h"
#import "UITipView.h"
#import "MdStyle.h"
#import "Masonry.h"

@interface UIFeedbackViewController ()

@end

@implementation UIFeedbackViewController{
    UITextView *_textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"投诉建议";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"内容："];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setTextColor:[MdColor defaultColor].contentColor];
    [label setFont:[MdFont defaultFont].contentFont];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        
        make.top.equalTo(self.view).offset(44+20+10);

        make.width.mas_equalTo(@90);
        make.height.mas_equalTo(@26);
    }];
    
    _textView = [[UITextView alloc] init];
    [_textView setTextColor:[MdColor defaultColor].contentColor];
    [_textView setFont:[MdFont defaultFont].contentFont];
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.layer.borderWidth = 1;
    [self.view addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.mas_equalTo(label.mas_bottom).offset(6);
        make.height.mas_equalTo(@300);
    }];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
    [submitBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
    [submitBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
    [self.view addSubview:submitBtn];
    [submitBtn addTarget:self action:@selector(submitBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_textView.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(@150);
        make.height.mas_equalTo(@30);
    }];
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onGestureRecognizerEvent:)];
    [self.view addGestureRecognizer:gr];
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

- (void)onGestureRecognizerEvent:(UIGestureRecognizer*)gestureRecognizer
{
    [_textView resignFirstResponder];
}

- (void)submitBtnEvent:(id)sender
{
    [UITipView showTip:@"您的投诉建议信息已提交。非常感谢您对我们的支持！"];
}

@end
