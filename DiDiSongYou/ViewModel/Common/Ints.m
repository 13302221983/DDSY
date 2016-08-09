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



/*
http://210.14.132.115/api/order/detail.do

{
  "orderNum": "26036324846796800"
}

{
  "header": {
    "errcode": "0000",
    "errmsg": "操作成功"
  },
  "body": {
    "notes": "",
    "fuel_name": "",
    "driver_mobile": "13800138001",
    "fuel_time": null,
    "vehicle_license": "",
    "real_name": "",
    "order_time": "2016-07-04 00:00:00",
    "fuel_consum": "0.00",
    "member_account": "5556666",
    "driver_name": "",
    "member_unit": "7.00",
    "dispath_time": null,
    "fuel_amount": "0.00",
    "id": "26036324846796801",
    "order_num": "26036324846796800",
    "fuel_card_no": "123456789",
    "status": "取消"
  }
}
*/





//============
+ (void)getOrderListForPageNum:(NSInteger)pageNum PageSize:(NSInteger)pageSize block:(ORDER_LIST_BLK)block
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


+ (void)changeToNewMobile:(NSString *)newMobile withVerifyCode:(NSString *)verifyCode block:(CHANGE_MOBILE_BLK)block
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


+ (void)changeToNewPassword:(NSString *)newPassword withVerifyCode:(NSString *)verifyCode block:(CHANGE_PASSWORD_BLK)block
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

/*
/api/member/vehicle.do

{
  "pageNum": 1,
  "pageSize": 10,
  "username": "gzOper"
}

{
  "header": {
    "errcode": "0000",
    "errmsg": "操作成功"
  },
  "body": {
    "list": [
      {
        "creator": "199024123456",
        "notes": null,
        "vehicle_license": "",
        "vehicle_type": "",
        "fuel_tank_capacity": "65.00",
        "belong_type": "",
        "engine_no": "DHJ5522133",
        "vin": "EFD559854146",
        "created_date": "2016-07-27 13:52:20",
        "id": "34419884679102464",
        "annual_ave_fuel_comsum": "656.00",
        "engine_capacity": "",
        "fuel_card_no": "54545454",
        "brand_model": "",
        "status": ""
      }
    ],
    "pageNumber": 1,
    "pageSize": 10,
    "totalPage": 1,
    "totalRow": 2,
    "firstPage": true,
    "lastPage": true
  }
}
*/


/*
http://210.14.132.115/api/member/vehicle/report-location.do

{
  "latitude": "23.14323",
  "location": "gz",
  "longitude": "123.1235",
  "region": "gz",
  "vehicleId": "34432058449330176"
}

{
  "header": {
    "errcode": "0000",
    "errmsg": "操作成功"
  },
  "body": {
    "result_desc": "SUCCESS"
  }
}
*/
@end
