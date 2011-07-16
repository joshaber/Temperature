//
//  TPElement+Private.m
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TPElement+Private.h"


@implementation TPElement (Private)


#pragma mark API

- (CFTypeRef)copyAttributeForKey:(NSString *)key {
	CFTypeRef value = NULL;
	AXUIElementCopyAttributeValue(self.elementRef, (__bridge CFStringRef) key, &value);
	return value;
}

- (id)wrappedAttributeForKey:(NSString *)key {
	CFTypeRef result = [self copyAttributeForKey:key];
	if(result == NULL) return nil;
	
	if([(__bridge id) result isKindOfClass:[NSArray class]]) {
		NSArray *resultArray = CFBridgingRelease(result);
		NSMutableArray *results = [NSMutableArray arrayWithCapacity:resultArray.count];
		for(id ref in resultArray) {
			[results addObject:[TPElement elementWithElementRef:(__bridge AXUIElementRef) ref]];
		}
		
		return [results copy];
	} else {
		TPElement *element = [TPElement elementWithElementRef:result];
		CFRelease(result);
		return element;
	}
}

@end
