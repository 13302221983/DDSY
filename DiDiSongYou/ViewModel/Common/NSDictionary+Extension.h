//
//  NSDictionary+Extension.h
//  OA2
//
//  Created by McKee on 15/9/29.
//  Copyright (c) 2015年 game-netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  本类对NSDictionary进行扩展，主要是按所需类型返回数据
 */
@interface NSDictionary (Extension)

/**
 *  返回字符串，并且保证不会返回nil
 *
 *  @param key 键
 *
 *  @return 非nil的NSString实例
 */
- (NSString*)stringForKey:(NSString*)key;

/**
 *  返回布尔值
 *
 *  @param key 键
 *
 *  @return 值为1或"1"时返回YES,否则返回NO
 */
- (BOOL)boolForKey:(NSString*)key;

/**
 *  返回整数NSInteger
 *
 *  @param key 键
 *
 *  @return 相应的整数
 */
- (NSInteger)integerForKey:(NSString*)key;

/**
 *  读取整型数据
 *
 *  @param key          键
 *  @param defaultValue 默认值
 *
 *  @return 相应的整数
 */
- (NSInteger)integerForKey:(NSString*)key defaultValue:(NSInteger)defaultValue;

/**
 *  返回长长整数
 *
 *  @param key 键
 *
 *  @return 长长整数
 */
- (long long)longlongForKey:(NSString*)key;

/**
 *  返回NSArray
 *
 *  @param key 键
 *
 *  @return NSArray实例或nil，，确保不会有其他类型
 */
- (NSArray*)arrayForKey:(NSString*)key;

/**
 *  返回NSDictionary实例
 *
 *  @param key 键
 *
 *  @return NSDictionary实例或nil，确保不会有其他类型
 */
- (NSDictionary*)dictionaryForKey:(NSString*)key;

@end

/**
 *  本类扩展NSMutableDictionary，如果写入的对象为nil，自动转为@”“，以确保不会引起闪退
 */
@interface NSMutableDictionary (Extension)

/**
 *  写入一个对象
 *
 *  @param anObject NSObject
 *  @param aKey     键
 */
- (void)exSetObject:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 *  写入一个整数，会自动转为NSNumber对象
 *
 *  @param integer 整数
 *  @param key     键
 */
- (void)setInteger:(NSInteger)integer forKey:(NSString*)key;


/**
 *  写入一个双长整数，会自动转为NSNumber对象
 *
 *  @param long long 双长整数
 *  @param key     键
 */
- (void)setLongLong:(long long)ll forKey:(NSString *)key;

/**
 *  写入YES或NO，会自动转为NSNumber对象
 *
 *  @param value YES或NO
 *  @param key   键
 */
- (void)setBool:(BOOL)value forKey:(NSString*)key;

@end