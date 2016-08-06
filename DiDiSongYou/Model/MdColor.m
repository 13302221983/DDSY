//
//  MdColor.m
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "MdColor.h"

@implementation MdColor

+ (instancetype)defaultColor{
    static MdColor *shareColorInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareColorInstance = [[MdColor alloc] init];
    });
    
    return shareColorInstance;
}

- (id)init{
    self = [super init];
    if (self) {
        self.titleColor = [UIColor whiteColor];
        self.naviButtonColor = [UIColor whiteColor];
        self.buttonColor = [UIColor whiteColor];
        self.contentColor = [UIColor blackColor];
        self.menuColor = [UIColor whiteColor];
    }
    
    return self;
}

@end
