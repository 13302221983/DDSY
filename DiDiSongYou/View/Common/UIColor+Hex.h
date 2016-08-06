//
//  UIColor+Hex.h
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  颜色扩展
 */
@interface UIColor (Hex)

/**
 *  获取颜色值
 *
 *  @param hexString 0xffffff
 *
 *  @return 返回颜色值
 */
+ (UIColor*)coloWithHex:(NSString*)hexString;
@end
