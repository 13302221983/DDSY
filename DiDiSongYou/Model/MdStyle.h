//
//  MdStyle.h
//  DiDiSongYou
//
//  Created by Wayne on 6/7/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#ifndef MDSTYLE_H
#define MDSTYLE_H

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:alphaValue]

#define ACOLOR UIColorFromRGBA(0x25a52c, 1)

#import "MdFont.h"
#import "MdColor.h"



#endif //MDSTYLE_H
