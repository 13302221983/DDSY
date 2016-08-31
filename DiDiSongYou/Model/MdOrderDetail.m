//
//  MdOrderDetail.m
//  Workload
//
//  Created by McKee on 16/8/31.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import "MdOrderDetail.h"

@implementation MdOrderDetail

+ (instancetype)fromDictionary:(NSDictionary *)dict
{
    MdOrderDetail *detail = [[MdOrderDetail alloc] init];
    detail.notes = [dict stringForKey:@"notes"];
    detail.fuel_name = [dict stringForKey:@"fuel_name"];
    detail.driver_mobile = [dict stringForKey:@"driver_mobile"];
    detail.fuel_time = [dict stringForKey:@"fuel_time"];
    detail.vehicle_license = [dict stringForKey:@"vehicle_license"];
    detail.real_name = [dict stringForKey:@"real_name"];
    detail.order_time = [dict stringForKey:@"order_time"];
    detail.fuel_consum = [dict stringForKey:@"fuel_consum"];
    detail.member_account = [dict stringForKey:@"member_account"];
    detail.driver_name = [dict stringForKey:@"driver_name"];
    detail.member_unit = [dict stringForKey:@"member_unit"];
    detail.dispath_time = [dict stringForKey:@"dispath_time"];
    detail.fuel_amount = [dict stringForKey:@"fuel_amount"];
    detail.Id = [dict stringForKey:@"id"];
    detail.order_num = [dict stringForKey:@"order_num"];
    detail.fuel_card_no = [dict stringForKey:@"fuel_card_no"];
    detail.status = [dict stringForKey:@"status"];
    return detail;
}

@end
