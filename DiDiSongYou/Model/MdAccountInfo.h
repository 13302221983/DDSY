//
//  MdAccountInfo.h
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  帐号信息对象
 */
@interface MdAccountInfo : NSObject
/**
 *  用户姓名
 */
@property (nonatomic, copy) NSString *name;
/**
 *  性别
 */
@property (nonatomic, copy) NSString *sex;
/**
 *  民族
 */
@property (nonatomic, copy) NSString *nation;
/**
 *  户籍所在地
 */
@property (nonatomic, copy) NSString *domicilePlace;
/**
 *  出生日期
 */
@property (nonatomic, copy) NSString *birthday;
/**
 *  身份证
 */
@property (nonatomic, copy) NSString *identity;
/**
 *  通讯地址
 */
@property (nonatomic, copy) NSString *address;
/**
 *  固定电话
 */
@property (nonatomic, copy) NSString *telephone;
/**
 *  移动电话
 */
@property (nonatomic, copy) NSString *mobile;
/**
 *  紧急联系人
 */
@property (nonatomic, copy) NSString *emergencyCotact;
/**
 *  紧急联系人电话
 */
@property (nonatomic, copy) NSString *emergencyPhone;
/**
 *  帐号
 */
@property (nonatomic, copy) NSString *account;
/**
 *  等级
 */
@property (nonatomic, copy) NSString *level;
/**
 *  登记场所
 */
@property (nonatomic, copy) NSString *registPlace;
/**
 *  登记车辆数
 */
@property (nonatomic, unsafe_unretained) NSInteger carCount;
/**
 *  登记日期
 */
@property (nonatomic, copy) NSString *registDate;
/**
 *  批准日期
 */
@property (nonatomic, copy) NSString *approvalDate;

@end
