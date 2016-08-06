//
//  UIHomeCollectionViewCell.h
//  DiDiSongYou
//
//  Created by Wayne on 5/28/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  首页菜单单元格处理类
 */
@interface UIHomeCollectionViewCell : UICollectionViewCell

/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 *  图标
 */
@property (nonatomic, strong) UIImageView *iconView;

@end
