//
//  TPTestStep.h
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	TPTestStepResultSuccess = 0,
	TPTestStepResultFailure,
} TPTestStepResult;

@class TPTestStep;
typedef TPTestStepResult (^TPTestStepExecutionBlock)(TPTestStep *step, NSError **error);


@interface TPTestStep : NSObject

+ (TPTestStep *)stepWithDescription:(NSString *)description executionBlock:(TPTestStepExecutionBlock)block;

- (TPTestStepResult)executeAndReturnError:(NSError **)error;

@property (nonatomic, readonly, copy) NSString *description;

@end
