//
//  MainWindowController.m
//  Ode
//
//  Created by Phillip Hutchings on 7/01/12.
//  Copyright (c) 2012 Xero. All rights reserved.
//

#import "MainWindowController.h"
#import "YammerConnection.h"

@implementation MainWindowController
@synthesize connectWindow, oauthOOBCode;


- (void)showOauthSheetIfNeeded {
    if (![YammerConnection isConnected]) {
        [NSBundle loadNibNamed:@"ConnectToYammer" owner:self];
        [NSApp beginSheet:connectWindow modalForWindow:[self window] modalDelegate:self
           didEndSelector:@selector(completeConnectSheetDidEnd:returnCode:contextInfo:) contextInfo:nil];
        [YammerConnection getAuthorisationUrl];
    }
}


- (IBAction)completeConnectSheet: (id)sender
{
    [NSApp endSheet:connectWindow];
}

- (void)completeConnectSheetDidEnd:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
    [sheet orderOut:self];
}
@end
