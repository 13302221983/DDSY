//
//  TestLoad.m
//  DiDiSongYou
//
//  Created by Wayne on 6/14/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "TestLoad.h"
#import "MdOrder.h"
#import "MdCarInfo.h"

@implementation TestLoad


+ (NSArray*)OrderData
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *file = [[NSBundle mainBundle] pathForResource:@"ordertest" ofType:@".plist"];
    NSArray *fileData = [NSArray arrayWithContentsOfFile:file];
    for (NSDictionary *info in fileData) {
        MdOrder *order = [[MdOrder alloc] init];
        order.code = [info objectForKey:@"code"];
        order.state = [info objectForKey:@"state"];
        order.car = [info objectForKey:@"car"];
        order.dateTime = [info objectForKey:@"time"];
        order.image = [info objectForKey:@"image"];
        order.money = [info objectForKey:@"money"];
        [array addObject:order];
    }
    
    return array;
}


+ (NSArray*)messageData
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"message" ofType:@".plist"];
    return [NSArray arrayWithContentsOfFile:file];
}


+ (NSArray*)carData
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *file = [[NSBundle mainBundle] pathForResource:@"car" ofType:@".plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:file];
    for (NSDictionary *info in data) {
        MdCarInfo *car = [[MdCarInfo alloc] init];
        car.identifier = [info objectForKey:@"identifier"];
        car.number = [info objectForKey:@"number"];
        car.oilCard = [info objectForKey:@"oilCard"];
        car.image = [info objectForKey:@"image"];
        
        [array addObject:car];
    }
    
    return array;
}

@end
