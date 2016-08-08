//
//  MdLoginUserInfo.h
//  DiDiSongYou
//
//  Created by McKee on 16/8/7.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MdUserDetail.h"


@interface MdLoginUserInfo : NSObject

/**
 * 所属表类型
 */
@property (nonatomic,copy) NSString *user_table;

/**
 * 移动电话
 */
@property (nonatomic,copy) NSString *mobile;

/**
 * 是否可用(0-不可用;1-可用)
 */
@property (nonatomic,copy) NSString *enabled;

/**
 * 账户过期时间
 */
@property (nonatomic,copy) NSString *expired_date;


/**
 * 密码过期时间
 */
@property (nonatomic,copy) NSString *pwd_expired_date;


/**
 * 所属用户表ID
 */
@property (nonatomic,copy) NSString *user_id;


/**
 * 验证表标志
 */
@property (nonatomic,copy) NSString *Id;


/**
 * 锁定标志(1-已锁;0-未锁)
 */
@property (nonatomic,copy) NSString *locked;


/**
 * 邮箱
 */
@property (nonatomic,copy) NSString *email;


/**
 * 登陆用户名
 */
@property (nonatomic,copy) NSString *username;

@property (nonatomic,copy) MdUserDetail *detail;

@end
