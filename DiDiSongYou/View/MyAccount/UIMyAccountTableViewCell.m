//
//  UIMyAccountTableViewCell.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIMyAccountTableViewCell.h"

@implementation UIMyAccountTableViewCell{
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


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView setFrame:CGRectMake(20, 5,30, 30)];
    
    _lineView.frame = CGRectMake(0, self.bounds.size.height-1, self.bounds.size.width, 1);
}
@end
