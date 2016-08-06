//
//  UIModalViewController.h
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "MdFont.h"
#import "MdColor.h"


/**
 *  模式视图基类
 */
@interface UIModalViewController : UIViewController

/**
 *  返回按钮
 */
@property (nonatomic, strong) UIButton *backButton;

/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 *  右侧按钮
 */
@property (nonatomic, strong) UIButton *rightButton;

/**
 *  标题（顶部菜单区视图）
 */
@property (nonatomic, strong) UIView *topView;

/**
 *  内容视图
 */
@property (nonatomic, strong) UIView *contentView;

@end
