//
//  LocalData.m
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "LocalData.h"
#import "TestLoad.h"

@implementation LocalData


+ (instancetype)shareLocalData
{
    static LocalData *shareLocalDataInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareLocalDataInstance = [[LocalData alloc] init];
    });
    
    return shareLocalDataInstance;
}

- (id)init{
    self = [super init];
    if (self) {
        
#ifdef TEST_VERSION
        MdAccountInfo *info = [[MdAccountInfo alloc] init];
        info.name = @"XX";
        info.sex = @"女";
        info.nation = @"汉";
        info.domicilePlace = @"XX";
        info.birthday = @"1880-01-11";
        info.identity = @"XXXXXX";
        info.address = @"XXXX";
        info.telephone = @"XXXXXX";
        info.mobile = @"XXXX";
        info.emergencyCotact = @"XX";
        info.emergencyPhone = @"XXXX";
        info.account = @"LGT0001";
        info.level = @"金卡";
        info.registPlace = @"XXX";
        info.carCount = 5;
        info.registDate = @"2016年4月25日";
        info.approvalDate= @"2016年4月26日";
        self.myAccountInfo = info;
#endif
    }
    return self;
}


@end
