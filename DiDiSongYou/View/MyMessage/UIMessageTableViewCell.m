//
//  UIMessageTableViewCell.m
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "UIMessageTableViewCell.h"

@implementation UIMessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    self.textLabel.frame = CGRectMake(10, 2, 200, 24);
    
    NSDictionary *dict = @{NSFontAttributeName:self.detailTextLabel.font,};
    NSString *text = self.detailTextLabel.text;
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(300, 60) // 用于计算文本绘制时占据的矩形块
                                         options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                      attributes:dict        // 文字的属性
                                         context:nil].size;

    self.detailTextLabel.frame = CGRectMake(10, 2+24, textSize.width+8, textSize.height+10);
    self.detailTextLabel.layer.cornerRadius = 10;
    self.detailTextLabel.backgroundColor = [UIColor lightGrayColor];
    self.detailTextLabel.clipsToBounds = YES;
    
}

@end
