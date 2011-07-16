//
//  TemperatureAppDelegate.h
//  Temperature
//
//  Created by Josh Abernathy on 7/15/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TemperatureAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *_window;
}

@property (strong) IBOutlet NSWindow *window;

@end
