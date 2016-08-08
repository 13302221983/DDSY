//
//  Ints.h
//  DiDiSongYou
//
//  Created by McKee on 16/8/6.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MdLoginUserInfo.h"
#import "MdUserDetail.h"
#import "MdPageInfo.h"
#import "MdChargeItem.h"

@interface Ints : NSObject

/*
NSString *page = @"";
NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];

AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
{
    NSDictionary *result = [Functions dictionaryWithResponseObject:response];
    NSDictionary *header = [result dictionaryForKey:@"header"];
    NSString *errcode = [header stringForKey:@"errcode"];
    NSString *error = nil;
    if( [errcode isEqualToString:@"0000"] )
    {
        NSDictionary *body = [result dictionaryForKey:@"body"];
    }
    else
    {
        error = [header stringForKey:@"body"];
    }
    if( block )
    {
        block( error );
    }
};

AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
{
    if( block )
    {
        block( error.localizedDescription );
    }
};

NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];

[[AFHTTPRequestOperationManagerEx manager] POST:url
                                     parameters:params
                                        success:success
                                        failure:failure];
*/

+ (void)loginAccount:(NSString*)account password:(NSString*)password block:(void(^)(NSString *error))block;

+ (void)getUserDetailWithBlock:(void(^)(NSString *error))block;

typedef void (^CHARGE_LIST_BLK)(NSArray *items, MdPageInfo *page, NSString *error);

+ (void)getChargeListForPageNum:(NSInteger)pageNum PageSize:(NSInteger)pageSize block:(CHARGE_LIST_BLK)block;

@end
