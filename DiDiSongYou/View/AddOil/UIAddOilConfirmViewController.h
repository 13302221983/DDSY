//
//  UIAddOilConfirmViewController.h
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MdCarInfo.h"

/**
 *  加油确实视图
 */
@interface UIAddOilConfirmViewController : UIViewController

/**
 *  汽车对象
 */
@property (nonatomic, strong) MdCarInfo* carInfo;

/**
 *  其他数据信息
 */
@property (nonatomic, strong) NSMutableDictionary *dataDict;

@end
