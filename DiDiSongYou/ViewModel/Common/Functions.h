//
//  Functions.h
//  Assets
//
//  Created by McKee on 15/6/18.
//  Copyright (c) 2015年 NetEase OA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




/**
 *  公共函数类
 */
@interface Functions : NSObject

/**
 *  把用AFNetworking库获取的接口返回转换成NSDictionary
 *
 *  @param responseObject 接口返回的数据段
 *
 *  @return NSDictionary
 */
+ (NSArray*)arrayWithResponseObject:(id)responseObject;

/**
 *  把用AFNetworking库获取的接口返回转换成NSArray
 *
 *  @param responseObject 接口返回的数据段
 *
 *  @return NSArray
 */
+ (NSDictionary*)dictionaryWithResponseObject:(id)responseObject;

/**
 *  计算文本完整显示所需要的区域
 *
 *  @param text     文本内容
 *  @param maxWidth 最大宽度
 *  @param font     所用的字体
 *
 *  @return 区域大小
 */
+ (CGSize)sizeForText:(NSString*)text maxWidth:(CGFloat)maxWidth font:(UIFont*)font;

/**
 *  MD5加密
 *
 *  @param plainString 明文
 *
 *  @return 32位大写密文
 */
+ (NSString*)makeMd5:(NSString*)plainString;

/**
 *  AES加密
 *
 *  @param encodeString 明文
 *  @param key          密钥1
 *  @param keyVi        密钥2
 *
 *  @return 密文
 */
+ (NSString*)aesEncodeWithString:(NSString*)encodeString
                             key:(NSString*)key
                           keyVi:(NSString*)keyVi;

/**
 *  AES解密
 *
 *  @param decodeString 密文
 *  @param key          密钥1
 *  @param keyVi        密钥2
 *
 *  @return 明文
 */
+ (NSString*)aesDecodeWithString:(NSString*)decodeString
                             key:(NSString*)key
                           keyVi:(NSString*)keyVi;

/**
 *  获取指定长度的子串，AES加解密过程会用到
 *
 *  @param str 原字符串
 *  @param len 子串长度
 *
 *  @return 子串
 */
+ (NSString*)getTheLenStr:(NSString*)str length:(int)len;


/**
 *  按格式返回今天的日期字符串
 *
 *  @param format 格式，如@"yy-MM-dd HH:mm:ss"
 *
 *  @return 字符串
 */
+ (NSString*)todayWithFormat:(NSString*)format;

/**
 *  判断指定的字符串是否符合邮箱地址规则
 *
 *  @param string 待校验文本
 *
 *  @return 符合返回YES，否则返回NO
 */
+ (BOOL)isEmailAddress:(NSString*)string;

/**
 *  判断指定的字符串是否符合手机号码规则
 *
 *  @param mobile 待校验广本
 *
 *  @return 符合返回YES，否则返回NO
 */
+ (BOOL)isMobile:(NSString *)mobile;

/**
 *  根据指定的格式把长长整型的时间转换成字符串类型
 *
 *  @param time   由1970-01-01 00:00:00(UTC)起的时间间隔，按毫秒算
 *  @param format 要显示的格式，如"yyyy-MM-dd HH:mm:ss"
 *
 *  @return 字符串
 */
+ (NSString*)dateStringFromLongLongTime:(long long)time format:(NSString*)format;

+ (NSString*)milliSecondTimestamp;

+ (NSDate*)dateForYearsAgo:(int)year;

/**
 *  返回一个UUID串
 *
 *  @return 字符串
 */
+ (NSString*)uuid;

/**
 *  计算HTML文本高度
 *
 *  @param text     HTML文本
 *  @param maxWidth 最大宽度
 *  @param font     字体
 *
 *  @return 所需区域的CGSize
 */
+ (CGSize)sizeForHtmlString:(NSString*)text maxWidth:(CGFloat)maxWidth font:(UIFont*)font;

@end
