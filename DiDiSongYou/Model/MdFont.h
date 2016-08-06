//
//  MdFont.h
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  字体模板类
 */
@interface MdFont : NSObject

/**
 *  默认实例
 *
 *  @return 实例对象
 */
+ (instancetype)defaultFont;

/**
 *  标题字体
 */
@property (nonatomic, strong) UIFont *titleFont;

/**
 *  按钮字体
 */
@property (nonatomic, strong) UIFont *buttonFont;

/**
 *  内容字体
 */
@property (nonatomic, strong) UIFont *contentFont;

/**
 *  菜单字体
 */
@property (nonatomic, strong) UIFont *menuFont;

@end
