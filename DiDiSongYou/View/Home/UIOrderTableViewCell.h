//
//  UIOrderTableViewCell.h
//  DiDiSongYou
//
//  Created by Wayne on 5/28/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  订单单元格处理类
 */
@interface UIOrderTableViewCell : UITableViewCell

/**
 *  状态状态
 */
@property (nonatomic, strong) UILabel *stateLabel;

/**
 *  编号标签
 */
@property (nonatomic, strong) UILabel *codeLabel;

/**
 *  车辆标签
 */
@property (nonatomic, strong) UILabel *carLabel;

/**
 *  时间标签
 */
@property (nonatomic, strong) UILabel *timeLabel;

@end
