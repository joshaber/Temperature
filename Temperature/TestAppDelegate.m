//
//  TestAppDelegate.m
//  Temperature
//
//  Created by Josh Abernathy on 7/15/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TestAppDelegate.h"
#import "TestController.h"


@implementation TestAppDelegate


#pragma mark NSApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
	[[TestController sharedInstance] startTesting];
}


#pragma mark API

@synthesize window;

@end
