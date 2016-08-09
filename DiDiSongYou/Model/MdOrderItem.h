//
//  MdOrderItem.h
//  Workload
//
//  Created by McKee on 16/8/9.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MdOrderItem : NSObject

@property (nonatomic, copy) NSString *driver_name;

@property (nonatomic, copy) NSString *notes;

@property (nonatomic, copy) NSString *dispath_time;

@property (nonatomic, copy) NSString *driver_mobile;

@property (nonatomic, copy) NSString *vehicle_license;

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *order_num;

@property (nonatomic, copy) NSString *order_time;

@property (nonatomic, copy) NSString *fuel_card_no;

@property (nonatomic, copy) NSString *status;

+ (instancetype)fromDictionary:(NSDictionary*)dictionary;

@end
