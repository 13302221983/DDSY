//
//  HttpAccess.h
//  DiDiSongYou
//
//  Created by Wayne on 16/6/23.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  http访问基类
 */
@interface HttpAccess : NSObject


+ (HttpAccess*)postRequest:(NSString*)url postData:(NSData*)postData header:(NSDictionary*)header;


@end
