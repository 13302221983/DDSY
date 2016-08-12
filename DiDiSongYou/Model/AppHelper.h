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


@property (nonatomic, copy) NSString *latitude;

@property (nonatomic, copy) NSString *longitude;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *region;

@property (nonatomic, copy) NSString *currentVehicleId;


+ (instancetype)helper;

@end
