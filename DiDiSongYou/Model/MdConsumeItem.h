//
//  MdConsumeItem.h
//  Workload
//
//  Created by McKee on 16/8/9.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MdConsumeItem : NSObject

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *consum_time;

@property (nonatomic, copy) NSString *consum_amount;

@property (nonatomic, copy) NSString *order_num;

+ (instancetype)fromDictionary:(NSDictionary*)dictionary;

@end
