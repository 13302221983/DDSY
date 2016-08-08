//
//  MdUserDetail.h
//  DiDiSongYou
//
//  Created by McKee on 16/8/8.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MdMemberLevel.h"
#import "MdMemberType.h"
#import "MdNation.h"

@interface MdUserDetail : NSObject

@property (nonatomic,copy) MdMemberLevel *memberLevel;

@property (nonatomic,copy) MdMemberType *memberType;

@property (nonatomic,copy) MdNation *nation;

@property (nonatomic,copy) NSString *apply_level;

@property (nonatomic,copy) NSString *approval;

@property (nonatomic,copy) NSString *approval_date;

@property (nonatomic,copy) NSString *balance;

@property (nonatomic,copy) NSString *birthday;

@property (nonatomic,copy) NSString *contact_address;

@property (nonatomic,copy) NSString *created_date;

@property (nonatomic,copy) NSString *creator;

@property (nonatomic,copy) NSString *email;

@property (nonatomic,copy) NSString *emergency_contact;

@property (nonatomic,copy) NSString *emergency_contact_phone;

@property (nonatomic,copy) NSString *franchise_infos_id;

@property (nonatomic,copy) NSString *gender;

@property (nonatomic,copy) NSString *Id;

@property (nonatomic,copy) NSString *id_card;

@property (nonatomic,copy) NSString *member_account;

@property (nonatomic,copy) NSString *mobile;

@property (nonatomic,copy) NSString *modifier;

@property (nonatomic,copy) NSString *notes;

@property (nonatomic,copy) NSString *overdraft;

@property (nonatomic,copy) NSString *pic_url;

@property (nonatomic,copy) NSString *real_name;

@property (nonatomic,copy) NSString *registered_residence;

@property (nonatomic,copy) NSString *status;

@property (nonatomic,copy) NSString *sum_charge;

@property (nonatomic,copy) NSString *sum_consum;

@property (nonatomic,copy) NSString *system_id;

@property (nonatomic,copy) NSString *telephone;

@property (nonatomic,copy) NSString *updated_date;

@property (nonatomic,copy) NSString *zip_code;

@end
