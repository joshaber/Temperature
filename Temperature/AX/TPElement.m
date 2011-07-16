//
//  TPElement.m
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TPElement.h"
#import "TPElement+Private.h"

@interface TPElement ()
@property (nonatomic, assign) AXUIElementRef elementRef;
@end


@implementation TPElement

- (void)dealloc {
	if(self.elementRef != NULL) {
		CFRelease(self.elementRef);
		self.elementRef = NULL;
	}
}

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@: %p> identifier: %@, role: %@, subrole: %@", NSStringFromClass([self class]), self, self.identifier, self.role, self.subrole];
}


#pragma mark API

@synthesize elementRef;

+ (TPElement *)elementWithElementRef:(AXUIElementRef)elementRef {
	return [[self alloc] initWithElementRef:elementRef];
}

- (id)initWithElementRef:(AXUIElementRef)ref {
	NSParameterAssert(ref != NULL);
	
	self = [super init];
	if(self == nil) return nil;
	
	self.elementRef = CFRetain(ref);
	
	return self;
}

- (TPElement *)childWithIdentifier:(NSString *)identifier {
	NSMutableArray *parentsToInvestigate = [NSMutableArray array];
	[parentsToInvestigate addObject:self];
	
	while(parentsToInvestigate.count > 0) {
//		@autoreleasepool {
			NSMutableArray *nextSetOfParents = [NSMutableArray array];
			for(TPElement *parent in parentsToInvestigate) {
				TPElement *match = [parent immediateChildWithIdentifier:identifier];
				if(match != nil) {
					return match;
				} else {
					[nextSetOfParents addObjectsFromArray:parent.children];
				}
			}
			
			parentsToInvestigate = nextSetOfParents;
//		}
	}
	
	return nil;
}

- (TPElement *)immediateChildWithIdentifier:(NSString *)identifier {
	NSLog(@"%@, %@", self.children, identifier);
	for(TPElement *child in self.children) {
		if([child.identifier isEqualToString:identifier]) {
			return child;
		}
	}
	
	return nil;
}

- (TPElement *)childWithPath:(NSString *)identifierPath {
	NSArray *elementIdentifiers = [identifierPath componentsSeparatedByString:@"/"];
	TPElement *currentElement = self;
	for(NSString *identifier in elementIdentifiers) {
		currentElement = [currentElement immediateChildWithIdentifier:identifier];
		if(currentElement == nil) break;
	}
	
	return nil;
}

- (void)performPressAction {
	AXUIElementPerformAction(self.elementRef, (CFStringRef) NSAccessibilityPressAction);
}

- (TPElement *)window {
	return [self wrappedAttributeForKey:NSAccessibilityWindowAttribute];
}

- (TPElement *)topLevelUIElement {
	return [self wrappedAttributeForKey:NSAccessibilityTopLevelUIElementAttribute];
}

- (NSArray *)children {
	return [self wrappedAttributeForKey:NSAccessibilityChildrenAttribute];
}

- (TPElement *)parent {
	return [self wrappedAttributeForKey:NSAccessibilityParentAttribute];
}

- (NSString *)role {
	return CFBridgingRelease([self copyAttributeForKey:NSAccessibilityRoleAttribute]);
}

- (NSString *)subrole {
	return CFBridgingRelease([self copyAttributeForKey:NSAccessibilitySubroleAttribute]);
}

- (NSString *)identifier {
	return CFBridgingRelease([self copyAttributeForKey:NSAccessibilityIdentifierAttribute]);
}

- (NSString *)title {
	return CFBridgingRelease([self copyAttributeForKey:NSAccessibilityTitleAttribute]);
}

- (NSString *)value {
	return CFBridgingRelease([self copyAttributeForKey:NSAccessibilityValueAttribute]);
}

- (NSRect)frame {
	NSPoint origin = [CFBridgingRelease([self copyAttributeForKey:NSAccessibilityPositionAttribute]) pointValue];
	NSSize size = [CFBridgingRelease([self copyAttributeForKey:NSAccessibilitySizeAttribute]) sizeValue];
	return NSMakeRect(origin.x, origin.y, size.width, size.height);
}

@end
