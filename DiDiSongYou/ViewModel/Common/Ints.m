//
//  Ints.m
//  DiDiSongYou
//
//  Created by McKee on 16/8/6.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import "Ints.h"
#import "AFHTTPRequestOperationManagerEx.h"
#import "Functions.h"

@implementation Ints

+ (void)loginAccount:(NSString *)account
            password:(NSString *)password
               block:(void (^)(NSString *))block
{
    NSString *page = @"/api/basic/authenticate.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER,page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        if( [errcode isEqualToString:@"0000"] )
        {
            MdLoginUserInfo *userInfo = [[MdLoginUserInfo alloc] init];
            NSDictionary *body = [result dictionaryForKey:@"body"];
            userInfo.user_table = [body stringForKey:@"user_table"];
            userInfo.mobile = [body stringForKey:@"mobile"];
            userInfo.enabled = [body stringForKey:@"enabled"];
            userInfo.expired_date = [body stringForKey:@"expired_date"];
            userInfo.pwd_expired_date = [body stringForKey:@"pwd_expired_date"];
            userInfo.user_id = [body stringForKey:@"user_id"];
            userInfo.Id = [body stringForKey:@"id"];
            userInfo.locked = [body stringForKey:@"locked"];
            userInfo.email = [body stringForKey:@"email"];
            userInfo.username = [body stringForKey:@"username"];
            [AppHelper helper].loginUserInfo = userInfo;
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
    [params setValue:account forKey:@"username"];
    [params setValue:password forKey:@"password"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}



+ (void)getUserDetailWithBlock:(void(^)(NSString *error))block
{
    NSString *page = @"/api/basic/infos.do";
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
            NSDictionary *member_level = [body dictionaryForKey:@"member_level"];
            NSDictionary *member_type = [body dictionaryForKey:@"member_type"];
            NSDictionary *nation = [body dictionaryForKey:@"nation"];
            
            MdMemberLevel *memberLevel = [[MdMemberLevel alloc] init];
            memberLevel.discount = [member_level stringForKey:@"discount"];
            memberLevel.enabled = [member_level stringForKey:@"enabled"];
            memberLevel.first_min_recharge_amount = [member_level stringForKey:@"first_min_recharge_amount"];
            memberLevel.Id = [member_level stringForKey:@"id"];
            memberLevel.level_name = [member_level stringForKey:@"level_name"];
            memberLevel.max_register_vehicles = [member_level stringForKey:@"max_register_vehicles"];
            memberLevel.min_recharge_amount = [member_level stringForKey:@"min_recharge_amount"];
            memberLevel.notes = [member_level stringForKey:@"notes"];
            
            MdMemberType *memberType = [[MdMemberType alloc] init];
            memberType.enabled = [member_type stringForKey:@"enabled"];
            memberType.Id = [member_type stringForKey:@"id"];
            memberType.notes = [member_type stringForKey:@"notes"];
            memberType.settle_type = [member_type stringForKey:@"settle_type"];
            memberType.type_name = [member_type stringForKey:@"type_name"];
            
            MdNation *mdNation = [[MdNation alloc] init];
            mdNation.Id = [nation stringForKey:@"id"];
            mdNation.nation_name = [nation stringForKey:@"nation_name"];
            
            MdUserDetail *detail = [[MdUserDetail alloc] init];
            detail.memberLevel = memberLevel;
            detail.memberType = memberType;
            detail.nation = mdNation;
            detail.apply_level = [body stringForKey:@"apply_level"];
            detail.approval = [body stringForKey:@"approval"];
            detail.approval_date = [body stringForKey:@"approval_date"];
            detail.balance = [body stringForKey:@"balance"];
            detail.birthday = [body stringForKey:@"birthday"];
            detail.contact_address = [body stringForKey:@"contact_address"];
            detail.created_date = [body stringForKey:@"created_date"];
            detail.creator = [body stringForKey:@"creator"];
            detail.email = [body stringForKey:@"email"];
            detail.emergency_contact = [body stringForKey:@"emergency_contact"];
            detail.emergency_contact_phone = [body stringForKey:@"emergency_contact_phone"];
            detail.franchise_infos_id = [body stringForKey:@"franchise_infos_id"];
            detail.gender = [body stringForKey:@"gender"];
            detail.Id = [body stringForKey:@"id"];
            detail.id_card = [body stringForKey:@"id_card"];
            detail.member_account = [body stringForKey:@"member_account"];
            detail.mobile = [body stringForKey:@"mobile"];
            detail.modifier = [body stringForKey:@"modifier"];
            detail.notes = [body stringForKey:@"notes"];
            detail.overdraft = [body stringForKey:@"overdraft"];
            detail.pic_url = [body stringForKey:@"pic_url"];
            detail.real_name = [body stringForKey:@"real_name"];
            detail.registered_residence = [body stringForKey:@"registered_residence"];
            detail.status = [body stringForKey:@"status"];
            detail.sum_charge = [body stringForKey:@"sum_charge"];
            detail.sum_consum = [body stringForKey:@"sum_consum"];
            detail.system_id = [body stringForKey:@"system_id"];
            detail.telephone = [body stringForKey:@"telephone"];
            detail.updated_date = [body stringForKey:@"updated_date"];
            detail.zip_code = [body stringForKey:@"zip_code"];
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
    [params setObject:[AppHelper helper].loginUserInfo.user_table forKey:@"table"];
    [params setObject:[AppHelper helper].loginUserInfo.user_id forKey:@"userId"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}



+ (void)getChargeListForPageNum:(NSInteger)pageNum
                       PageSize:(NSInteger)pageSize
                          block:(CHARGE_LIST_BLK)block
{
    NSString *page = @"/api/member/charge.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        NSMutableArray *items;
        MdPageInfo *page;
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        if( [errcode isEqualToString:@"0000"] )
        {
            items = [[NSMutableArray alloc] initWithCapacity:0];
            NSDictionary *body = [result dictionaryForKey:@"body"];
            NSArray *list = [body arrayForKey:@"list"];
            for( NSDictionary *item in list )
            {
                [items addObject:[MdChargeItem fromDictionary:item]];
            }
            
            page = [MdPageInfo fromDictionary:body];
        }
        else
        {
            error = [header stringForKey:@"body"];
        }
        if( block )
        {
            block( items, page, error );
        }
    };
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if( block )
        {
            block( nil, nil, error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    [params setInteger:pageNum forKey:@"pageNum"];
    [params setInteger:pageSize forKey:@"pageSize"];
    [params setObject:[AppHelper helper].loginUserInfo.username forKey:@"username"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}



+ (void)getConsumeListForPageNum:(NSInteger)pageNum
                        PageSize:(NSInteger)pageSize
                           block:(CONSUME_LIST_BLK)block
{
    NSString *page = @"/api/member/consum.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        MdPageInfo *page;
        NSMutableArray *items;
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        if( [errcode isEqualToString:@"0000"] )
        {
            items = [[NSMutableArray alloc] initWithCapacity:0];
            NSDictionary *body = [result dictionaryForKey:@"body"];
            NSArray *list = [body arrayForKey:@"list"];
            for( NSDictionary *consume in list )
            {
                [items addObject:[MdConsumeItem fromDictionary:consume]];
            }
            
            page = [MdPageInfo fromDictionary:body];
        }
        else
        {
            error = [header stringForKey:@"errmsg"];
        }
        if( block )
        {
            block( items, page, error );
        }
    };
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if( block )
        {
            block( nil, nil, error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    [params setInteger:pageNum forKey:@"pageNum"];
    [params setInteger:pageSize forKey:@"pageSize"];
    [params setObject:[AppHelper helper].loginUserInfo.username forKey:@"username"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}


/*
 /api/member/vehicle.do
 
 {
 "pageNum": 1,
 "pageSize":1 0,
 "username": "gzOper"
 }
 
 {
 "header": {
 "errcode": "0011",
 "errmsg": "请求异常"
 },
 "body": {
 "code": "400",
 "reason": "Bad Request"
 }
 }
 */




/*
 POST /api/order/create.do
 
 {
 "fuelAmount": 0,
 "fuelConsum": 0,
 "fuelId": 0,
 "fuelUnit": 0,
 "latitude": 0,
 "location": "string",
 "longitude": 0,
 "region": "string",
 "vehicleLicense": "string"
 }
 
 */
//================



+ (void)getOrderDetail:(NSString *)orderNum block:(OrderDetailBlk)block
{
    NSString *page = @"/api/order/detail.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSDictionary *body = [result dictionaryForKey:@"body"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = [header stringForKey:@"errmsg"];
        MdOrderDetail *detail;
        if( [errcode isEqualToString:@"0000"] )
        {
            detail = [MdOrderDetail fromDictionary:body];
        }
        else
        {
            error = [header stringForKey:@"errmsg"];
        }
        if( block )
        {
            block( detail, error );
        }
    };
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if( block )
        {
            block( nil, error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}



+ (void)getOrderListForPageNum:(NSInteger)pageNum
                      PageSize:(NSInteger)pageSize
                         block:(ORDER_LIST_BLK)block
{
    NSString *page = @"/api/order/list.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        MdPageInfo *page;
        NSMutableArray *items;
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        if( [errcode isEqualToString:@"0000"] )
        {
            items = [[NSMutableArray alloc] initWithCapacity:0];
            NSDictionary *body = [result dictionaryForKey:@"body"];
            NSArray *list = [body arrayForKey:@"list"];
            for( NSDictionary *order in list )
            {
                [items addObject:[MdOrderItem fromDictionary:order]];
            }
            
            page = [MdPageInfo fromDictionary:body];
        }
        else
        {
            error = [header stringForKey:@"errmsg"];
        }
        if( block )
        {
            block( items, page, error );
        }
    };
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if( block )
        {
            block( nil, nil, error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    [params setInteger:pageNum forKey:@"pageNum"];
    [params setInteger:pageSize forKey:@"pageSize"];
    [params setObject:[AppHelper helper].loginUserInfo.username forKey:@"username"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}


+ (void)changeToNewMobile:(NSString *)newMobile
           withVerifyCode:(NSString *)verifyCode
                    block:(CHANGE_MOBILE_BLK)block
{
    NSString *page = @"/api/user/modify-mobile.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        BOOL succeeded = NO;
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSDictionary *body = [result dictionaryForKey:@"body"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        if( [errcode isEqualToString:@"0000"] )
        {
            succeeded = YES;
        }
        else
        {
            error = [body stringForKey:@"result_desc"];
        }
        if( block )
        {
            block( succeeded, error );
        }
    };
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if( block )
        {
            block( NO, error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    [params setObject:[AppHelper helper].loginUserInfo.mobile forKey:@"mobile"];
    [params setObject:[AppHelper helper].loginUserInfo.username forKey:@"username"];
    [params setObject:newMobile forKey:@"newMobile"];
    [params setObject:verifyCode forKey:@"verifyCode"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}


+ (void)changeToNewPassword:(NSString *)newPassword
             withVerifyCode:(NSString *)verifyCode
                      block:(CHANGE_PASSWORD_BLK)block
{
    NSString *page = @"/api/user/modify-password.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        BOOL succeeded = NO;
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSDictionary *body = [result dictionaryForKey:@"body"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        if( [errcode isEqualToString:@"0000"] )
        {
            succeeded = YES;
        }
        else
        {
            error = [body stringForKey:@"result_desc"];
        }
        if( block )
        {
            block( succeeded, error );
        }
    };
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if( block )
        {
            block( NO, error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    [params setObject:[AppHelper helper].loginUserInfo.mobile forKey:@"mobile"];
    [params setObject:[AppHelper helper].loginUserInfo.username forKey:@"username"];
    [params setObject:newPassword forKey:@"newPassword"];
    [params setObject:verifyCode forKey:@"verifyCode"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}




+ (void)getVehiclesWithPageNum:(NSInteger)pageNum
                      pageSize:(NSInteger)pageSize
                         block:(VEHICLES_BLK)block
{
    NSString *page = @"/api/member/vehicle.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSDictionary *body = [result dictionaryForKey:@"body"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        MdPageInfo *page;
        NSMutableArray *vehicles;
        if( [errcode isEqualToString:@"0000"] )
        {
            vehicles = [[NSMutableArray alloc] initWithCapacity:0];
            NSArray *list = [body arrayForKey:@"list"];
            for( NSDictionary *item in list )
            {
                [vehicles addObject:[MdVehicle fromDictionary:item]];
            }
            
            page = [MdPageInfo fromDictionary:body];
        }
        else
        {
            error = [header stringForKey:@"errmsg"];
        }
        if( block )
        {
            block( vehicles, page, error );
        }
    };
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if( block )
        {
            block( nil, nil, error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    [params setInteger:pageSize forKey:@"pageSize"];
    [params setInteger:pageNum forKey:@"pageNum"];
    [params setObject:[AppHelper helper].loginUserInfo.username forKey:@"username"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];

}

+ (void)reportLocationWithBlock:(OPER_BLK)block
{
    NSString *page = @"/api/member/vehicle/report-location.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER, page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response)
    {
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        BOOL succeeded = NO;
        if( [errcode isEqualToString:@"0000"] )
        {
            succeeded = YES;
        }
        else
        {
            error = [header stringForKey:@"errmsg"];
        }
        if( block )
        {
            block( succeeded, error );
        }
    };
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if( block )
        {
            block( NO, error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    [params setObject:[AppHelper helper].latitude forKey:@"latitude"];
    [params setObject:[AppHelper helper].location forKey:@"location"];
    [params setObject:[AppHelper helper].longitude forKey:@"longitude"];
    [params setObject:[AppHelper helper].region forKey:@"region"];
    [params setObject:[AppHelper helper].currentVehicleId forKey:@"vehicleId"];
    
    [[AFHTTPRequestOperationManagerEx manager] POST:url
                                         parameters:params
                                            success:success
                                            failure:failure];
}


@end
