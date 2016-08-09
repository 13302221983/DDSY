//
//  MdOrderItem.m
//  Workload
//
//  Created by McKee on 16/8/9.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import "MdOrderItem.h"

@implementation MdOrderItem

+ (instancetype)fromDictionary:(NSDictionary *)dictionary
{
    MdOrderItem *item = [[MdOrderItem alloc] init];
    item.driver_name = [dictionary stringForKey:@"driver_name"];
    item.notes = [dictionary stringForKey:@"notes"];
    item.dispath_time = [dictionary stringForKey:@"dispath_time"];
    item.driver_mobile = [dictionary stringForKey:@"driver_mobile"];
    item.vehicle_license = [dictionary stringForKey:@"vehicle_license"];
    item.Id = [dictionary stringForKey:@"id"];
    item.order_num = [dictionary stringForKey:@"order_num"];
    item.order_time = [dictionary stringForKey:@"order_time"];
    item.fuel_card_no = [dictionary stringForKey:@"fuel_card_no"];
    item.status = [dictionary stringForKey:@"status"];
    return item;
}

@end
