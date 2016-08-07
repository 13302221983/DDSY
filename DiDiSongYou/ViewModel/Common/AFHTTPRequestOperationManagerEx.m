//
//  AFHTTPRequestOperationManagerEx.m
//  Recruitment
//
//  Created by McKee on 16/3/25.
//  Copyright © 2016年 OA.NETEASE. All rights reserved.
//


#import "AFHTTPRequestOperationManagerEx.h"
#import "AFJSONResponseSerializerEx.h"
#import "AFJSONRequestSerializerEx.h"
#import "Functions.h"

@implementation AFHTTPRequestOperationManagerEx


+ (instancetype)manager {
    AFHTTPRequestOperationManagerEx *manager = [[[super class] alloc] initWithBaseURL:nil];
    manager.responseSerializer = [[AFJSONResponseSerializerEx alloc] init];
    manager.requestSerializer = [[AFJSONRequestSerializerEx alloc] init];
    return manager;
}


- (AFHTTPRequestOperation *)HTTPRequestOperationWithHTTPMethod:(NSString *)method
                                                     URLString:(NSString *)URLString
                                                    parameters:(id)parameters
                                                       success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:&serializationError];
    if (serializationError) {
        if (failure) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
#pragma clang diagnostic pop
        }
        
        return nil;
    }
    
    NSString *app_code = @"LeQMA8kH5Z4PctUdAFD2";
    NSString *app_secret = @"91ecfedd296c05b12c9daa2e5590dc70";
    NSString *platform = @"IOS";
    NSString *nonce_str = [Functions uuid];
    NSString *timestamp = [Functions milliSecondTimestamp];
    NSString *device_info = [[NSUserDefaults standardUserDefaults] stringForKey:@"dvice_info"];
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:0];
    NSDictionary *paramsDict = (NSDictionary*)parameters;
    NSMutableDictionary *paramsTemp = [[NSMutableDictionary alloc] initWithDictionary:paramsDict];
    [paramsTemp setObject:app_code forKey:@"app_code"];
    [paramsTemp setObject:nonce_str forKey:@"nonce_str"];
    [paramsTemp setObject:platform forKey:@"platform"];
    [paramsTemp setObject:timestamp forKey:@"timestamp"];
    [paramsTemp setObject:device_info forKey:@"device_info"];
    
    for( NSString *key in paramsTemp.allKeys )
    {
        NSInteger index = 0;
        while( index < keys.count )
        {
            NSString *keyTemp = keys[index];
            if( [key compare:keyTemp] == NSOrderedAscending )
            {
                [keys insertObject:key atIndex:index];
                break;
            }
            index++;
        }
        
        if( index == keys.count )
        {
            [keys addObject:key];
        }
    }
    
    NSMutableString *stringA = [[NSMutableString alloc] initWithCapacity:0];
    for( NSString *key in keys )
    {
        NSString *value = [paramsTemp objectForKey:key];
        if( stringA.length == 0 )
        {
            [stringA appendFormat:@"%@=%@", key, value];
        }
        else
        {
            [stringA appendFormat:@"&%@=%@", key, value];
        }
    }
    [stringA appendFormat:@"%@", app_secret];
    NSString *signature = [Functions makeMd5:stringA];
    
    [request setValue:app_code forHTTPHeaderField:@"app_code"];
    [request setValue:nonce_str forHTTPHeaderField:@"nonce_str"];
    [request setValue:platform forHTTPHeaderField:@"platform"];
    [request setValue:timestamp forHTTPHeaderField:@"timestamp"];
    [request setValue:device_info forHTTPHeaderField:@"device_info"];
    [request setValue:signature forHTTPHeaderField:@"signature"];

    AF_HTTP_REQUEST_FAILURE failureEX = ^(AFHTTPRequestOperation *operation, NSError *error){
        if( failure )
        {
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"发送请求失败，请稍后重试" forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"network error" code:9999 userInfo:userInfo];
            failure(operation, err);
        }
    };
    
    NSString *bodyString = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
    NSLog(@"%@\nheaders:\n%@\nsignatureTemp:\n%@\nparams:\n%@", URLString, request.allHTTPHeaderFields, stringA, bodyString);
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failureEX];
    [operation setWillSendRequestForAuthenticationChallengeBlock:^(NSURLConnection *connection, NSURLAuthenticationChallenge *challenge) {
        if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
            DEBUGLOG(@"NSURLAuthenticationMethodServerTrust");
            [[challenge sender] useCredential:[NSURLCredential credentialForTrust:[challenge.protectionSpace serverTrust]] forAuthenticationChallenge:challenge];
        }
        else if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodClientCertificate])
        {
            DEBUGLOG(@"NSURLAuthenticationMethodClientCertificate");
        }
        else
        {
            DEBUGLOG(@"Auth Challenge Failed");
            [[challenge sender]cancelAuthenticationChallenge:challenge];
        }
    }];
    
    return operation;

}

@end
