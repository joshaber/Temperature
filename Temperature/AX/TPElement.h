//
//  TPElement.h
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TPElement : NSObject

+ (TPElement *)elementWithElementRef:(AXUIElementRef)elementRef;

- (id)initWithElementRef:(AXUIElementRef)ref;

- (TPElement *)childWithIdentifier:(NSString *)identifier; // breadth-first searches until it finds a match or runs out of children
- (TPElement *)immediateChildWithIdentifier:(NSString *)identifier; // only searches in the element's immediate children
- (TPElement *)childWithPath:(NSString *)identifierPath;

- (void)performPressAction;

@property (nonatomic, assign, readonly) AXUIElementRef elementRef;
@property (nonatomic, readonly) TPElement *window;
@property (nonatomic, readonly) TPElement *topLevelUIElement;
@property (nonatomic, readonly) NSArray *children;
@property (nonatomic, readonly) TPElement *parent;
@property (nonatomic, readonly) NSString *role;
@property (nonatomic, readonly) NSString *subrole;
@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *value;
@property (nonatomic, readonly) NSRect frame; // in screen coordinates

@end
