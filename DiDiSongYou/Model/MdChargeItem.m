//
//  MdChargeItem.m
//  Workload
//
//  Created by McKee on 16/8/8.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import "MdChargeItem.h"

@implementation MdChargeItem

+ (instancetype)fromDictionary:(NSDictionary *)dictionary
{
    MdChargeItem *item = [[MdChargeItem alloc] init];
    item.Id = [dictionary stringForKey:@"id"];
    item.charge_amount = [dictionary stringForKey:@"charge_amount"];
    item.charge_time = [dictionary stringForKey:@"charge_time"];
    return item;
}

@end
