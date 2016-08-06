//
//  UIOrderTableViewCell.m
//  DiDiSongYou
//
//  Created by Wayne on 5/28/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIOrderTableViewCell.h"
#import "Masonry.h"
#import "MdStyle.h"

@implementation UIOrderTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //image
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(@10);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        //state
        self.stateLabel = self.textLabel;
        [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imageView.mas_right).offset(10);
            make.top.mas_equalTo(@4);
            make.right.mas_equalTo(self.mas_right).offset(-80);
            make.height.mas_equalTo(@26);
        }];
        
        //code
        self.codeLabel = self.detailTextLabel;
        [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.stateLabel);
            make.top.mas_equalTo(self.stateLabel.mas_bottom).offset(2);
            make.right.equalTo(self.stateLabel);
            make.height.equalTo(self.stateLabel);
        }];
        
        //car
        self.carLabel = [[UILabel alloc] init];
        [self addSubview:self.carLabel];
        [self.carLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.stateLabel);
            make.top.mas_equalTo(self.codeLabel.mas_bottom).offset(2);
            make.right.equalTo(self.stateLabel);
            make.height.equalTo(self.stateLabel);
        }];
        
        //time
        [self addSubview:self.carLabel];
        self.timeLabel = [[UILabel alloc] init];
        [self addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(4);
            make.top.equalTo(self.stateLabel);
            make.width.mas_equalTo(@160);
            make.height.equalTo(self.stateLabel);
        }];
        
        
        //init
        [self initLabel:self.stateLabel];
        [self initLabel:self.codeLabel];
        [self initLabel:self.carLabel];
        [self initLabel:self.timeLabel];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor grayColor];
        lineView.alpha = 0.4;
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.height.mas_equalTo(@1);
            make.left.equalTo(self);
            make.right.equalTo(self);
        }];
    }
    return self;
}

- (void)layoutSubviews
{
    
}

- (void)initLabel:(UILabel*)label
{
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentLeft;
    [label setFont:[MdFont defaultFont].contentFont];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
