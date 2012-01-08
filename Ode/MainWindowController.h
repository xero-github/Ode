//
//  MainWindowController.h
//  Ode
//
//  Created by Phillip Hutchings on 7/01/12.
//  Copyright (c) 2012 Xero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainWindowController : NSWindowController
@property (nonatomic, retain) IBOutlet NSWindow *connectWindow;
@property (nonatomic, retain) IBOutlet NSTextView *oauthOOBCode;

- (void)showOauthSheetIfNeeded;
- (IBAction)completeConnectSheet: (id)sender;

@end
