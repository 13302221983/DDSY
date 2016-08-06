//
//  MdOrder.h
//  DiDiSongYou
//
//  Created by Wayne on 5/26/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  主界面菜单项
 */
@interface MdOrder : NSObject

/**
 *  订单编号
 */
@property (nonatomic, copy) NSString *code;

/**
 *  状态
 */
@property (nonatomic, copy) NSString *state;

/**
 *  车辆
 */
@property (nonatomic, copy) NSString *car;

/**
 *  时间
 */
@property (nonatomic, copy) NSString *dateTime;

/**
 *  图标图片
 */
@property (nonatomic, copy) NSString *image;

/**
 *  通知时间
 */
@property (nonatomic, copy) NSString *notifyTime;

/**
 *  司机
 */
@property (nonatomic, copy) NSString *driver;

/**
 *  联系电话
 */
@property (nonatomic, copy) NSString *mobile;
/**
 *  消费金额
 */
@property (nonatomic, copy) NSString *money;

@end
