//
//  NSDictionary+Extension.m
//  OA2
//
//  Created by McKee on 15/9/29.
//  Copyright (c) 2015年 game-netease. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSString*)stringForKey:(NSString *)key
{
    NSObject *value = [self objectForKey:key];
    if( [value isKindOfClass:[NSString class]] ){
        return (NSString*)value;
    }
    else if( [value isKindOfClass:[NSNumber class]] ){
        NSNumber *number = (NSNumber*)value;
        return [NSString stringWithFormat:@"%ld", (long)[number integerValue]];
    }
    else{
        return @"";
    }
}

- (BOOL)boolForKey:(NSString *)key
{
    NSObject *obj = [self objectForKey:key];
    if( [obj isKindOfClass:[NSNumber class]] ){
        NSNumber *num = (NSNumber*)obj;
        return num.boolValue;
    }
    else if( [obj isKindOfClass:[NSString class]] ){
        NSString *value = (NSString*)obj;
        value = value.lowercaseString;
        if( [value isEqualToString:@"true"] || [value isEqualToString:@"1"] || [value isEqualToString:@"yes"] ){
            return YES;
        }
    }
    return NO;
}

- (NSInteger)integerForKey:(NSString*)key
{
    NSObject *obj = [self objectForKey:key];
    if( [obj isKindOfClass:[NSNumber class]] ){
        NSNumber *num = (NSNumber*)obj;
        return num.intValue;
    }
    else if( [obj isKindOfClass:[NSString class]] ){
        NSString *value = (NSString*)obj;
        return value.integerValue;
    }
    return 0;
}


- (NSInteger)integerForKey:(NSString*)key defaultValue:(NSInteger)defaultValue
{
    NSObject *obj = [self objectForKey:key];
    if( [obj isKindOfClass:[NSNumber class]] ){
        NSNumber *num = (NSNumber*)obj;
        return num.intValue;
    }
    else if( [obj isKindOfClass:[NSString class]] ){
        NSString *value = (NSString*)obj;
        return value.integerValue;
    }
    return defaultValue;
}

- (long long)longlongForKey:(NSString*)key
{
    NSObject *obj = [self objectForKey:key];
    if( [obj isKindOfClass:[NSNumber class]] ){
        NSNumber *num = (NSNumber*)obj;
        return num.longLongValue;
    }
    else if( [obj isKindOfClass:[NSString class]] ){
        NSString *value = (NSString*)obj;
        return value.longLongValue;
    }
    return 0;
}

- (NSArray*)arrayForKey:(NSString *)key
{
    NSObject *obj = [self objectForKey:key];
    if( [obj isKindOfClass:[NSArray class]] ){
        return (NSArray*)obj;
    }
    else{
        return nil;
    }
}

- (NSDictionary*)dictionaryForKey:(NSString*)key
{
    NSObject *obj = [self objectForKey:key];
    if( [obj isKindOfClass:[NSDictionary class]] )
    {
        return (NSDictionary*)obj;
    }
    else{
        return nil;
    }
}

@end







@implementation NSMutableDictionary (Extension)

- (void)exSetObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    [self setObject:anObject ? anObject : @"" forKey:aKey];
}

- (void)setInteger:(NSInteger)integer forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithInteger:integer] forKey:key];
}

- (void)setLongLong:(long long)ll forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithLongLong:ll] forKey:key];
}

- (void)setBool:(BOOL)value forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithBool:value] forKey:key];
}

@end
