//
//  LocalData.h
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MdAccountInfo.h"

/**
 *  本地或缓存数据处理类
 */
@interface LocalData : NSObject

/**
 *  我的帐户信息
 */
@property (nonatomic, strong) MdAccountInfo *myAccountInfo;

/**
 *  共享的数据实例
 *
 *  @return 实例对象
 */
+ (instancetype)shareLocalData;

@end
