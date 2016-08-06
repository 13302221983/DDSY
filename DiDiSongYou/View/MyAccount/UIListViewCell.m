//
//  UIListViewCell.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIListViewCell.h"
#import "MdStyle.h"
#import "Masonry.h"

@implementation UIListViewCell{
    NSMutableArray *_columnArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setColumnCount:(NSInteger)count
{
    _columnArray = [[NSMutableArray alloc] init];
    
    UILabel *leftLabel;
    for (int i = 0; i < count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.numberOfLines = 1;
        [label setFont:[MdFont defaultFont].contentFont];
        [label setTextColor:[MdColor defaultColor].contentColor];
        [label setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            if (leftLabel) {
                make.left.mas_equalTo(leftLabel.mas_right);
            }else{
                make.left.equalTo(self);
            }
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.width.mas_equalTo(self).multipliedBy(1.0/count);
        }];
        leftLabel = label;
        [_columnArray addObject:label];
        if (i != count -1) {
            UIView* lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor lightGrayColor];
            lineView.alpha = 0.4;
            [label addSubview:lineView];
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(label);
                make.width.mas_equalTo(@1);
                make.bottom.equalTo(label);
                make.top.equalTo(label);
            }];
        }
    }
    
    UIView* lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    lineView.alpha = 0.4;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

- (BOOL)setColumnTitle:(NSString*)title withColumn:(NSInteger)column
{
    if (column >= 0 && column < [_columnArray count]) {
        UILabel *label = [_columnArray objectAtIndex:column];
        [label setText:title];
        return YES;
    }
    return NO;
}

- (id)viewWithColumn:(NSInteger)column
{
    if (column >= 0 && column < [_columnArray count]) {
        UILabel *label = [_columnArray objectAtIndex:column];
        return label;
    }
    return nil;
}
@end
