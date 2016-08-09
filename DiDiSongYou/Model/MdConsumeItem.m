//
//  MdConsumeItem.m
//  Workload
//
//  Created by McKee on 16/8/9.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import "MdConsumeItem.h"

@implementation MdConsumeItem

+ (instancetype)fromDictionary:(NSDictionary *)dictionary
{
    MdConsumeItem *item = [[MdConsumeItem alloc] init];
    item.Id = [dictionary stringForKey:@"id"];
    item.consum_amount = [dictionary stringForKey:@"consum_amount"];
    item.consum_time = [dictionary stringForKey:@"consum_time"];
    item.order_num = [dictionary stringForKey:@"order_num"];
    return item;
}

@end
