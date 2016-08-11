//
//  MdVehicle.m
//  Workload
//
//  Created by McKee on 16/8/11.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import "MdVehicle.h"

@implementation MdVehicle

+ (instancetype)fromDictionary:(NSDictionary *)dictionary
{
    MdVehicle *vehicle = [[MdVehicle alloc] init];
    vehicle.creator = [dictionary stringForKey:@"creator"];
    vehicle.notes = [dictionary stringForKey:@"notes"];
    vehicle.vehicle_license = [dictionary stringForKey:@"vehicle_license"];
    vehicle.vehicle_type = [dictionary stringForKey:@"vehicle_type"];
    vehicle.fuel_tank_capacity = [dictionary stringForKey:@"fuel_tank_capacity"];
    vehicle.belong_type = [dictionary stringForKey:@"belong_type"];
    vehicle.engine_no = [dictionary stringForKey:@"engine_no"];
    vehicle.vin = [dictionary stringForKey:@"vin"];
    vehicle.created_date = [dictionary stringForKey:@"created_date"];
    vehicle.Id = [dictionary stringForKey:@"id"];
    vehicle.annual_ave_fuel_comsum = [dictionary stringForKey:@"annual_ave_fuel_comsum"];
    vehicle.engine_capacity = [dictionary stringForKey:@"engine_capacity"];
    vehicle.fuel_card_no = [dictionary stringForKey:@"fuel_card_no"];
    vehicle.brand_model = [dictionary stringForKey:@"brand_model"];
    vehicle.status = [dictionary stringForKey:@"status"];
    return vehicle;
}

@end
