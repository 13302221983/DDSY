//
//  UIAboutViewController.m
//  DiDiSongYou
//
//  Created by Wayne on 6/18/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIAboutViewController.h"
#import "Masonry.h"
#import "MdStyle.h"

@interface UIAboutViewController ()

@end

@implementation UIAboutViewController{
    UILabel *_newVersionLabel;
    UIView *contentView;
}

- (void)loadView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"UIAboutViewController" owner:self options:nil];
    self.view = [nibView firstObject];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关于";
    self.view.backgroundColor = [UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1.0];
 
    /*
    _newVersionLabel = [[UILabel alloc] init];
    [_newVersionLabel setText:@"新版本1.0.0"];
    [_newVersionLabel setTextAlignment:NSTextAlignmentLeft];
    [_newVersionLabel setTextColor:[MdColor defaultColor].contentColor];
    [_newVersionLabel setFont:[MdFont defaultFont].contentFont];
    [contentView addSubview:_newVersionLabel];
    [_newVersionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(10);
        make.left.equalTo(contentView);
        make.right.equalTo(contentView).offset(-10);
        make.height.mas_equalTo(@21);
    }];
    
    UILabel *header = [[UILabel alloc] init];
    [header setText:@"软件介绍："];
    [header setTextAlignment:NSTextAlignmentLeft];
    [header setTextColor:[MdColor defaultColor].contentColor];
    [header setFont:[MdFont defaultFont].contentFont];
   
    [contentView addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_newVersionLabel.mas_bottom).offset(6);
        make.left.equalTo(_newVersionLabel);
        make.width.mas_equalTo(@80);
        make.height.mas_equalTo(@21);
    }];

    
    UILabel *content = [[UILabel alloc] init];
    [content setText:@"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"];
    [content setTextAlignment:NSTextAlignmentLeft];
    [content setTextColor:[MdColor defaultColor].contentColor];
    [content setFont:[MdFont defaultFont].contentFont];
     content.numberOfLines = 0;
    content.lineBreakMode = NSLineBreakByWordWrapping;
    [contentView addSubview:content];
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header);
        make.left.mas_equalTo(header.mas_right).offset(4);
        make.right.equalTo(contentView).offset(-2);
        make.bottom.equalTo(contentView);
    }];
    */
    
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

@end
