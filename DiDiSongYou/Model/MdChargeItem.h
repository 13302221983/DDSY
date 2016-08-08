//
//  MdChargeItem.h
//  Workload
//
//  Created by McKee on 16/8/8.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MdChargeItem : NSObject

@property (nonatomic,copy) NSString *Id;

@property (nonatomic,copy) NSString *charge_amount;

@property (nonatomic,copy) NSString *charge_time;

+ (instancetype)fromDictionary:(NSDictionary*)dictionary;

@end
