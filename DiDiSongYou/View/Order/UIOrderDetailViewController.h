//
//  UIOrderDetailViewController.h
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MdOrder.h"

/**
 *  订单详情
 */
@interface UIOrderDetailViewController : UIViewController

/**
 *  订单对象
 */
@property (nonatomic, strong) MdOrder *order;

@end
