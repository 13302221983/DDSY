//
//  MdFont.m
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "MdFont.h"

@implementation MdFont


+ (instancetype)defaultFont{
    static MdFont *shareFontInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareFontInstance = [[MdFont alloc] init];
    });
    
    return shareFontInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.titleFont = [UIFont boldSystemFontOfSize:14];
        
        self.buttonFont = [UIFont boldSystemFontOfSize:14];
        
        self.contentFont = [UIFont systemFontOfSize:14];
    }
    return self;
}

@end
