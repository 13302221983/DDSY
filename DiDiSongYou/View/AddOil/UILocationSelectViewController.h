//
//  UILocationSelectViewController.h
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MdCarInfo.h"

/**
 *  位置选择
 */
@interface UILocationSelectViewController : UIViewController

/**
 *  汽车对象
 */
@property (nonatomic, strong) MdCarInfo* carInfo;

@end
