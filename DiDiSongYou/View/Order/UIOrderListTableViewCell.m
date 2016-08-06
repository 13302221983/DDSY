//
//  UIOrderListTableViewCell.m
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIOrderListTableViewCell.h"
#import "Masonry.h"
#import "MdStyle.h"

@implementation UIOrderListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(@10);
            make.right.mas_equalTo(@(-10));
            make.top.mas_equalTo(@6);
            make.bottom.mas_equalTo(@(-2));
        }];
        
        [self.textLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [self.textLabel setTextColor:[MdColor defaultColor].contentColor];
        
        [self.detailTextLabel setFont:[MdFont defaultFont].contentFont];
        [self.detailTextLabel setTextColor:[MdColor defaultColor].contentColor];
        self.detailTextLabel.numberOfLines = 0;
        self.detailTextLabel.textAlignment = NSTextAlignmentLeft;
        //状态
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(@10);
            make.right.equalTo(self.contentView);
            make.top.mas_equalTo(@4);
            make.height.mas_equalTo(@20);
        }];
        
        //
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.alpha = 0.4;
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.mas_equalTo(self.textLabel.mas_bottom).offset(4);
            make.height.mas_equalTo(@1);
        }];
        
        
        [self.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(@10);
            make.right.equalTo(self.contentView);
            make.top.mas_equalTo(lineView.mas_bottom).offset(4);
            make.bottom.equalTo(self.contentView);
        }];
        
        
        self.detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.detailBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
        [self.detailBtn setTitle:@"详情" forState:UIControlStateNormal];
        [self.detailBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
        [self.detailBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
        [self.contentView addSubview:self.detailBtn];
        [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView).offset(0);
            make.top.equalTo(self.contentView);
            make.height.mas_equalTo(@28);
            make.width.mas_equalTo(@40);
        }];
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelBtn setBackgroundColor:[UIColor colorWithRed:235/255.0 green:131/255.0 blue:48/255.0 alpha:1.0]];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn.titleLabel setFont:[MdFont defaultFont].buttonFont];
        [self.cancelBtn setTitleColor:[MdColor defaultColor].buttonColor forState:UIControlStateNormal];
        [self.contentView addSubview:self.cancelBtn];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.detailBtn.mas_left).offset(-4);
            make.top.equalTo(self.detailBtn);
            make.height.mas_equalTo(@28);
            make.width.mas_equalTo(@40);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    
}

@end
