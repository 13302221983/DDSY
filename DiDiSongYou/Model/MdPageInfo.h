//
//  MdPageInfo.h
//  Workload
//
//  Created by McKee on 16/8/8.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MdPageInfo : NSObject

@property (nonatomic) NSInteger pageNumber;

@property (nonatomic) NSInteger pageSize;

@property (nonatomic) NSInteger totalPage;

@property (nonatomic) NSInteger totalRow;

@property (nonatomic) BOOL firstPage;

@property (nonatomic) BOOL lastPage;

+ (instancetype)fromDictionary:(NSDictionary*)dictionary;

@end
