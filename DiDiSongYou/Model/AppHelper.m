//
//  AppHelper.m
//  DiDiSongYou
//
//  Created by McKee on 16/8/8.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

+ (instancetype)helper
{
    static AppHelper *appHelper = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void){
        appHelper = [[AppHelper alloc] init];
    });
    return appHelper;
}

@end
