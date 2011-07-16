//
//  GHTApplication.m
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TPApplication.h"
#import "TPElement+Private.h"

@interface TPApplication ()
- (id)initWithPID:(pid_t)pid;
@end


@implementation TPApplication


#pragma mark API

+ (TPApplication *)applicationWithCurrentApplication {
	return [[self alloc] initWithPID:[[NSRunningApplication currentApplication] processIdentifier]];
}

+ (TPApplication *)applicationWithBundleIdentifier:(NSString *)bundleIdentifier {
	NSArray *apps = [NSRunningApplication runningApplicationsWithBundleIdentifier:bundleIdentifier];
	if(apps.count > 1) {
		NSLog(@"Whoa, we found multiple running apps with that bundle ID: %@. We're just going to use the last one.", apps);
	}
	
	return [[self alloc] initWithPID:[[apps lastObject] processIdentifier]];
}

- (id)initWithPID:(pid_t)pid {
	AXUIElementRef appRef = AXUIElementCreateApplication(pid);
	self = [super initWithElementRef:appRef];
	CFRelease(appRef);
	
	if(self == nil) return nil;
	
	CFArrayRef names;
	AXUIElementCopyAttributeNames(appRef, &names);
	NSLog(@"%@", names);
	
	return self;
}

- (TPElement *)mainWindow {
	return [self wrappedAttributeForKey:NSAccessibilityMainWindowAttribute];
}

- (TPElement *)focusedWindow {
	return [self wrappedAttributeForKey:NSAccessibilityFocusedWindowAttribute];
}

- (NSArray *)windows {
	return [self wrappedAttributeForKey:NSAccessibilityWindowsAttribute];
}

@end
