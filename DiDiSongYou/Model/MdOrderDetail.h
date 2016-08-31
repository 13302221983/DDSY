//
//  MdOrderDetail.h
//  Workload
//
//  Created by McKee on 16/8/31.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MdOrderDetail : NSObject

@property (nonatomic, copy) NSString *notes;

@property (nonatomic, copy) NSString *fuel_name;

@property (nonatomic, copy) NSString *driver_mobile;

@property (nonatomic, copy) NSString *fuel_time;

@property (nonatomic, copy) NSString *vehicle_license;

@property (nonatomic, copy) NSString *real_name;

@property (nonatomic, copy) NSString *order_time;

@property (nonatomic, copy) NSString *fuel_consum;

@property (nonatomic, copy) NSString *member_account;

@property (nonatomic, copy) NSString *driver_name;

@property (nonatomic, copy) NSString *member_unit;

@property (nonatomic, copy) NSString *dispath_time;

@property (nonatomic, copy) NSString *fuel_amount;

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *order_num;

@property (nonatomic, copy) NSString *fuel_card_no;

@property (nonatomic, copy) NSString *status;


+ (instancetype)fromDictionary:(NSDictionary*)dict;

@end
