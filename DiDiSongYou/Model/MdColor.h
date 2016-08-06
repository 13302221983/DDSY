//
//  MdColor.h
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"
/**
 *  颜色模式处理类
 */
@interface MdColor : NSObject

/**
 *  标题文字颜色
 */
@property (nonatomic, strong) UIColor* titleColor;
/**
 *  导航按钮文字颜色
 */
@property (nonatomic, strong) UIColor* naviButtonColor;

/**
 *  按钮文字颜色
 */
@property (nonatomic, strong) UIColor* buttonColor;

/**
 *  内容文字颜色
 */
@property (nonatomic, strong) UIColor* contentColor;

/**
 *  菜单颜色
 */
@property (nonatomic, strong) UIColor* menuColor;

/**
 *  默认实例
 *
 *  @return 实例对象
 */
+ (instancetype)defaultColor;

@end
