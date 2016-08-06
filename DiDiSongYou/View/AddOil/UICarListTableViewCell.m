//
//  UICarListTableViewCell.m
//  DiDiSongYou
//
//  Created by Wayne on 6/18/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UICarListTableViewCell.h"

@implementation UICarListTableViewCell{
    UIView *_lineView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        _lineView.alpha = 0.4;
        [self addSubview:_lineView];
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


- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(15, 5, 40, 40);
    _lineView.frame = CGRectMake(0, self.bounds.size.height-1, self.bounds.size.width, 1);
}
@end
