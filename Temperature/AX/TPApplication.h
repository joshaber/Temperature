//
//  GHTApplication.h
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPElement.h"


@interface TPApplication : TPElement

+ (TPApplication *)applicationWithCurrentApplication;
+ (TPApplication *)applicationWithBundleIdentifier:(NSString *)bundleIdentifier;

@property (nonatomic, readonly) TPElement *mainWindow;
@property (nonatomic, readonly) TPElement *focusedWindow;
@property (nonatomic, readonly) TPElement *windows;

@end
