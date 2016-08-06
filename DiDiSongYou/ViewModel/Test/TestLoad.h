//
//  TestLoad.h
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TEST_VERSION

/**
 *  测试数据加载
 */
@interface TestLoad : NSObject

/**
 *  订单列表测试数据
 *
 *  @return 订单列表
 */
+ (NSArray*)OrderData;

/**
 *  消息列表测试数据
 *
 *  @return 消息列表
 */
+ (NSArray*)messageData;

/**
 *  汽车测试数据
 *
 *  @return 汽车列表    
 */
+ (NSArray*)carData;

@end
