//
//  MdVehicle.h
//  Workload
//
//  Created by McKee on 16/8/11.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MdVehicle : NSObject

@property (nonatomic, copy) NSString *creator;

@property (nonatomic, copy) NSString *notes;

@property (nonatomic, copy) NSString *vehicle_license;

@property (nonatomic, copy) NSString *vehicle_type;

@property (nonatomic, copy) NSString *fuel_tank_capacity;

@property (nonatomic, copy) NSString *belong_type;

@property (nonatomic, copy) NSString *engine_no;

@property (nonatomic, copy) NSString *vin;

@property (nonatomic, copy) NSString *created_date;

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *annual_ave_fuel_comsum;

@property (nonatomic, copy) NSString *engine_capacity;

@property (nonatomic, copy) NSString *fuel_card_no;

@property (nonatomic, copy) NSString *brand_model;

@property (nonatomic, copy) NSString *status;

+ (instancetype)fromDictionary:(NSDictionary*)dictionary;

@end
