//
//  AppHelper.h
//  DiDiSongYou
//
//  Created by McKee on 16/8/8.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MdLoginUserInfo.h"


@interface AppHelper : NSObject

@property (nonatomic, copy) MdLoginUserInfo *loginUserInfo;



+ (instancetype)helper;

@end
