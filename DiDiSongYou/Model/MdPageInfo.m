//
//  MdPageInfo.m
//  Workload
//
//  Created by McKee on 16/8/8.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import "MdPageInfo.h"

@implementation MdPageInfo

+ (instancetype)fromDictionary:(NSDictionary *)dictionary
{
    MdPageInfo *page = [[MdPageInfo alloc] init];
    page.pageNumber = [dictionary integerForKey:@"pageNumber"];
    page.pageSize = [dictionary integerForKey:@"pageSize"];
    page.totalPage = [dictionary integerForKey:@"totalPage"];
    page.totalRow = [dictionary integerForKey:@"totalRow"];
    page.firstPage = [dictionary boolForKey:@"firstPage"];
    page.lastPage = [dictionary boolForKey:@"lastPage"];
    return page;
}

@end
