//
//  YammerConnection.m
//  Ode
//
//  Created by Phillip Hutchings on 7/01/12.
//  Copyright (c) 2012 Xero. All rights reserved.
//

#import "ApiKeys.h"
#import "YammerConnection.h"
#import "OAuthConsumer/OAuthConsumer.h"
#import "OAuthConsumer/OAToken_KeychainExtensions.h"

#define YammerAppName @"Ode"
#define YammerServiceName @"Yammer"

@implementation YammerConnection
+ (bool) isConnected {
    OAToken *accessToken = [[OAToken alloc] initWithKeychainUsingAppName:YammerAppName
                                                     serviceProviderName:YammerServiceName];
    
    return accessToken != nil;
}

+ (NSString *) getAuthorisationUrl {
    OAConsumer *consumer = [[OAConsumer alloc] initWithKey:YAMMER_TOKEN
                                                    secret:YAMMER_TOKEN_SECRET];
    
    NSURL *url = [NSURL URLWithString:@"http://example.com/get_request_token"];
    
    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:url
                                                                   consumer:consumer
                                                                      token:nil   // we don't have a Token yet
                                                                      realm:nil   // our service provider doesn't specify a realm
                                                          signatureProvider:nil]; // use the default method, HMAC-SHA1
    
    [request setHTTPMethod:@"POST"];
    
    OADataFetcher *fetcher = [[OADataFetcher alloc] init];
    
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(requestTokenTicket:didFinishWithData:)
                  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];
    return @"";
}


@end
