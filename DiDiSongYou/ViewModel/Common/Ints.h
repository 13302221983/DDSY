//
//  Ints.h
//  DiDiSongYou
//
//  Created by McKee on 16/8/6.
//  Copyright © 2016年 GuoTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ints : NSObject

+ (void)loginAccount:(NSString*)account password:(NSString*)password block:(void(^)(NSString *error))block;

@end
