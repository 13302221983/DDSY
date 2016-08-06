//
//  UIOrderListTableViewCell.h
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  订单列表单元视图
 */
@interface UIOrderListTableViewCell : UITableViewCell

/**
 *  取消按钮
 */
@property (nonatomic, strong) UIButton *cancelBtn;

/**
 *  详情按钮
 */
@property (nonatomic, strong) UIButton *detailBtn;

@end
