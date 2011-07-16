//
//  TPTestController.h
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TPApplication;
@class TPTestScenario;

typedef void (^TPTestControllerCompletionBlock)(BOOL success, NSError *error);


@interface TPTestController : NSObject

+ (id)sharedInstance;

- (void)initializeTestScenarios;

- (void)addScenario:(TPTestScenario *)scenario;

- (void)startTesting;

@property (nonatomic, readonly, strong) TPApplication *application;

@end
