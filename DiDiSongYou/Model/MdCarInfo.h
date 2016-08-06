//
//  MdCarInfo.h
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  车辆信息对象
 */
@interface MdCarInfo : NSObject

/**
 *  id
 */
@property (nonatomic, copy) NSString *identifier;

/**
 *  车牌
 */
@property (nonatomic, copy) NSString *number;

/**
 *  加油卡号
 */
@property (nonatomic, copy) NSString *oilCard;

/**
 *  车辆图片
 */
@property (nonatomic, copy) NSString *image;

@end
