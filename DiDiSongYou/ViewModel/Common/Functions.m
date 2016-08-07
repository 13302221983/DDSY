//
//  Functions.m
//  Assets
//
//  Created by McKee on 15/6/18.
//  Copyright (c) 2015年 NetEase OA. All rights reserved.
//

#import "Functions.h"
#import <CommonCrypto/CommonCrypto.h>
#import "CocoaSecurity.h"

@implementation Functions

+ (NSArray*)arrayWithResponseObject:(id)responseObject
{
    NSData *responseData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
    NSError *error = nil;
    NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:responseData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&error];
    if( responseArray && ![responseArray isKindOfClass:[NSArray class]] )
    {
        responseArray = nil;
    }
    return responseArray;
}

+ (NSDictionary*)dictionaryWithResponseObject:(id)responseObject
{
    NSData *responseData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
    NSError *error = nil;
    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseData
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&error];
    if( responseDic && ![responseDic isKindOfClass:[NSDictionary class]] )
    {
        responseDic = nil;
    }
    return responseDic;

}


+ (CGSize)sizeForText:(NSString*)text maxWidth:(CGFloat)maxWidth font:(UIFont*)font
{
   // CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(maxWidth, 5000.0) lineBreakMode:NSLineBreakByWordWrapping];
    NSMutableDictionary *attrs = [[NSMutableDictionary alloc] initWithCapacity:0];
    [attrs setObject:font forKey:NSFontAttributeName];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(maxWidth, 5000.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    return CGSizeMake(rect.size.width, rect.size.height+1);
}

+ (NSString*)makeMd5:(NSString *)plainString
{
    const char *src = [plainString UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(src, (unsigned int)strlen(src), md5Buffer);
    NSMutableString *result = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH];
    for( int i = 0; i < CC_MD5_DIGEST_LENGTH; i++ ){
        [result appendString:[NSString stringWithFormat:@"%02X", md5Buffer[i]]];
    }
    return result;
}


+ (NSString*)aesEncodeWithString:(NSString*)encodeString key:(NSString*)key keyVi:(NSString*)keyVi
{
    NSData *keyData = [[Functions getTheLenStr:key length:16] dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyViData = [[Functions getTheLenStr:keyVi length:16] dataUsingEncoding:NSUTF8StringEncoding];
    
    CocoaSecurityResult *encodeData = [CocoaSecurity aesEncrypt:encodeString key:keyData iv:keyViData];
    return encodeData.base64;
}

+ (NSString*)aesDecodeWithString:(NSString*)decodeString key:(NSString*)key keyVi:(NSString*)keyVi
{
    NSString *returnString = nil;
    @try {
        NSData *keyData = [[Functions getTheLenStr:key length:16] dataUsingEncoding:NSUTF8StringEncoding];
        NSData *keyViData = [[Functions getTheLenStr:keyVi length:16] dataUsingEncoding:NSUTF8StringEncoding];
        
        CocoaSecurityResult *decodeData = [CocoaSecurity aesDecryptWithBase64:decodeString key:keyData iv:keyViData];
        returnString = decodeData.utf8String;
    }
    @catch (NSException *exception) {
        returnString = nil;
    }
    
    return returnString;
}


+ (NSString*)getTheLenStr:(NSString*)str length:(int)len
{
    @autoreleasepool
    {
        if(str.length >= len)
        {
            str = [str substringToIndex:len];
        }
        else
        {
            int fillZeroCount = len - (int)str.length;
            NSString *stringFormat = [NSString stringWithFormat:@"%%%d.%dd", fillZeroCount, fillZeroCount];
            NSString *fillZeroString = [NSString stringWithFormat:stringFormat, 0];
            str = [str stringByAppendingString:fillZeroString];
        }
    }
    
    return str;
}



+ (NSString*)todayWithFormat:(NSString *)format
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = format;
    return  [df stringFromDate:[NSDate date]];
}

+ (BOOL)isEmailAddress:(NSString *)string
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL result = [emailTest evaluateWithObject:string];
    return result;
}

+ (BOOL)isMobile:(NSString *)mobile
{
    //手机号以1开头，10个 \d 数字字符
    NSString *phoneRegex = @"^1\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}


+ (NSString*)dateStringFromLongLongTime:(long long)orignalTime format:(NSString *)format
{
    if( orignalTime == 0 ) return @"";
        
    NSTimeInterval interval = orignalTime / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeZone = [NSTimeZone localTimeZone];
    df.dateFormat = format;
    return [df stringFromDate:date];

}

+ (NSString*)milliSecondTimestamp
{
    NSTimeInterval interval = [NSDate date].timeIntervalSince1970;
    return [NSString stringWithFormat:@"%lld", (long long)interval*1000];
}

+ (NSDate*)dateForYearsAgo:(int)year
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeZone = [NSTimeZone systemTimeZone];
    df.dateFormat = @"yyyy-MM-dd";
    NSString *today = [df stringFromDate:[NSDate date]];
    NSString *currentYear = [today substringToIndex:4];
    NSString *pastYear = [NSString stringWithFormat:@"%d", currentYear.intValue-year];
    NSString *pastDay = [today stringByReplacingOccurrencesOfString:currentYear withString:pastYear];
    return [df dateFromString:pastDay];
}

+ (NSDate*)dateForYearsAfter:(int)year
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeZone = [NSTimeZone systemTimeZone];
    df.dateFormat = @"yyyy-MM-dd";
    NSString *today = [df stringFromDate:[NSDate date]];
    NSString *currentYear = [today substringToIndex:4];
    NSString *futureYear = [NSString stringWithFormat:@"%d", currentYear.intValue+year];
    NSString *futureDay = [today stringByReplacingOccurrencesOfString:currentYear withString:futureYear];
    return [df dateFromString:futureDay];
}


+ (NSString*)uuid
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}

+ (CGSize)sizeForHtmlString:(NSString *)text maxWidth:(CGFloat)maxWidth font:(UIFont*)font
{
    if( [UIDevice currentDevice].systemVersion.floatValue >= 7.0 )
    {
        NSAttributedString * strAtt = [[NSAttributedString alloc] initWithData:[text dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSFontAttributeName:font} documentAttributes:nil error:nil];
        CGRect rect = [strAtt boundingRectWithSize:CGSizeMake(maxWidth, 10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        return rect.size;
    }
    else{
        return [Functions sizeForText:text maxWidth:maxWidth font:font];
    }
}

@end
