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
#import "NSDictionary+Extension.h"

@implementation Ints

/*
 {"header":{"errcode":"0000","errmsg":"操作成功"},"body":{"user_table":"MECP_MEMBER","mobile":"13480238579","enabled":"1","expired_date":"2019-06-23 16:58:09","pwd_expired_date":"2016-09-23 16:58:09","user_id":"34368003919446016","id":"22145461313863680","locked":"0","email":"binljb@qq.com","username":"gzOper"}}
 */
+ (void)loginAccount:(NSString *)account password:(NSString *)password block:(void (^)(NSString *))block
{
    NSString *page = @"/api/basic/authenticate.do";
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER,page];
    
    AF_HTTP_REQUEST_SUCCESS success = ^(AFHTTPRequestOperation *operation, id response){
        NSDictionary *result = [Functions dictionaryWithResponseObject:response];
        NSDictionary *header = [result dictionaryForKey:@"header"];
        NSString *errcode = [header stringForKey:@"errcode"];
        NSString *error = nil;
        if( [errcode isEqualToString:@"0000"] )
        {
            NSDictionary *body = [result dictionaryForKey:@"errmsg"];
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
    
    AF_HTTP_REQUEST_FAILURE failure = ^(AFHTTPRequestOperation *operation, NSError *error){
        if( block )
        {
            block( error.localizedDescription );
        }
    };
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithCapacity:0];
    [params setValue:account forKey:@"username"];
    [params setValue:password forKey:@"password"];
    [[AFHTTPRequestOperationManagerEx manager] POST:url parameters:params success:success failure:failure];
}


/*
 http://210.14.132.115/api/basic/infos.do
 
 {
 "table": "MECP_MEMBER",
 "userId": 34368003919446016
 }
 
 {
 "header": {
 "errcode": "0000",
 "errmsg": "操作成功"
 },
 "body": {
 "birthday": "2016-06-28 00:00:00",
 "member_type": {
 "enabled": "1",
 "id": "15390530884075520",
 "notes": "",
 "settle_type": "2",
 "type_name": "加油站会员"
 },
 "notes": null,
 "sum_charge": "65000.00",
 "gender": "M",
 "franchise_infos_id": "21331630991867904",
 "nation": {
 "id": "01",
 "nation_name": "汉族"
 },
 "overdraft": "0.00",
 "modifier": "199024123456",
 "id_card": "4418225664445522",
 "real_name": "张三",
 "zip_code": "510006",
 "balance": "59500.00",
 "id": "34368003919446016",
 "contact_address": "广东广州",
 "emergency_contact_phone": null,
 "email": null,
 "approval_date": "2016-07-27 10:29:54",
 "creator": "199024123456",
 "approval": "199024123458",
 "system_id": "21331630991867904",
 "mobile": null,
 "sum_consum": "5500.00",
 "telephone": null,
 "member_account": "5556666",
 "member_level": {
 "discount": "0.85",
 "enabled": "1",
 "first_min_recharge_amount": "2500.00",
 "id": "20679234083094528",
 "level_name": "",
 "max_register_vehicles": "3",
 "min_recharge_amount": "5000.00",
 "notes": ""
 },
 "registered_residence": "广东广州",
 "apply_level": "15717531566211072",
 "created_date": "2016-07-27 10:26:27",
 "updated_date": "2016-07-27 14:14:39",
 "pic_url": null,
 "emergency_contact": null,
 "status": "2"
 }
 }
 */


/*
 POST /api/member/charge.do
 
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
 "id": "1",
 "charge_amount": "10000.00",
 "charge_time": "2016-07-01 15:41:08"
 },
 {
 "id": "2",
 "charge_amount": "5000.00",
 "charge_time": "2016-07-01 16:33:11"
 },
 {
 "id": "3",
 "charge_amount": "50000.00",
 "charge_time": "2016-07-26 11:23:12"
 }
 ],
 "pageNumber": 1,
 "pageSize": 10,
 "totalPage": 1,
 "totalRow": 3,
 "firstPage": true,
 "lastPage": true
 }
 }
 */


/*
 POST /api/member/consum.do
 
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
 "consum_time": "2016-07-01 15:41:47",
 "consum_amount": "5000.00",
 "id": "1",
 "order_num": "26110882056503296"
 },
 {
 "consum_time": "2016-07-01 15:42:10",
 "consum_amount": "500.00",
 "id": "2",
 "order_num": "35208044984008704"
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
 POST /api/order/list.do
 
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
 "driver_name": "林师傅",
 "notes": "尽快来",
 "dispath_time": null,
 "driver_mobile": "13800138001",
 "vehicle_license": "粤A88888",
 "id": "26036324846796801",
 "order_num": "26036324846796800",
 "order_time": "2016-07-04 00:00:00",
 "fuel_card_no": "123456789",
 "status": "取消"
 },
 {
 "driver_name": "林师傅",
 "notes": null,
 "dispath_time": null,
 "driver_mobile": "13800138001",
 "vehicle_license": "粤A88888",
 "id": "26110882056503297",
 "order_num": "26110882056503296",
 "order_time": "2016-07-04 15:35:19",
 "fuel_card_no": "123456789",
 "status": "已下单"
 },
 {
 "driver_name": "林师傅",
 "notes": null,
 "dispath_time": null,
 "driver_mobile": "13800138001",
 "vehicle_license": "粤Z88888",
 "id": "35208044988203008",
 "order_num": "35208044984008704",
 "order_time": "2016-07-29 18:04:12",
 "fuel_card_no": "4545454545",
 "status": "已下单"
 }
 ],
 "pageNumber": 1,
 "pageSize": 10,
 "totalPage": 1,
 "totalRow": 3,
 "firstPage": true,
 "lastPage": true
 }
 }
 */



/*
 POST /api/user/modify-mobile.do
 
 {
 "mobile": "13300001111",
 "newMobile": "13311110000",
 "username": "gzOper",
 "verifyCode": "x123"
 }
 
 {
 "header": {
 "errcode": "0012",
 "errmsg": "参数错误"
 },
 "body": {
 "result_desc": "旧手机号码不正确！"
 }
 }
 */





/*
  /api/user/modify-password.do
 
 {
 "mobile": "13300001111",
 "newPassword": "wxiekek",
 "username": "gzOper",
 "verifyCode": "111xxx"
 }
 
 {
 "header": {
 "errcode": "0012",
 "errmsg": "参数错误"
 },
 "body": {
 "result_desc": "手机号码不正确！"
 }
 }
 */

@end
