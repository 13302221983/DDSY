//
//  UIHomeCollectionViewCell.m
//  DiDiSongYou
//
//  Created by Wayne on 5/28/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIHomeCollectionViewCell.h"
#import "Masonry.h"
#import "MdStyle.h"

@implementation UIHomeCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        [label setTextAlignment:NSTextAlignmentCenter];
        label.numberOfLines = 1;
        [label setFont:[UIFont boldSystemFontOfSize:16]];
        
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        self.titleLabel = label;
        

        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor yellowColor];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(32, 32));
        }];
        self.iconView = imageView;
    }
    return self;
}

@end
