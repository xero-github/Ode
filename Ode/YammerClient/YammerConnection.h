//
//  YammerConnection.h
//  Ode
//
//  Created by Phillip Hutchings on 7/01/12.
//  Copyright (c) 2012 Xero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YammerConnection : NSObject
+ (bool) isConnected;
+ (NSString *) getAuthorisationUrl;
@end
