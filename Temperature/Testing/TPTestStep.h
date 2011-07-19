//
//  TPTestStep.h
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TPElement;

#define TPTestCondition(condition, error, ...) ({ \
if (!(condition)) { \
if (error) { \
*error = [[NSError alloc] initWithDomain:@"TPTest" code:TPTestStepResultFailure userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:__VA_ARGS__], NSLocalizedDescriptionKey, nil]]; \
} \
return TPTestStepResultFailure; \
} \
})

typedef enum {
	TPTestStepResultSuccess = 0,
	TPTestStepResultFailure,
} TPTestStepResult;

@class TPTestStep;
typedef TPTestStepResult (^TPTestStepExecutionBlock)(TPTestStep *step, NSError **error);


@interface TPTestStep : NSObject

+ (TPTestStep *)stepWithDescription:(NSString *)description executionBlock:(TPTestStepExecutionBlock)block;
+ (TPTestStep *)stepThatFails;
+ (TPTestStep *)stepThatSucceeds;
+ (TPTestStep *)stepToWaitForViewWithAccessibilityIdentifier:(NSString *)identifier;
+ (TPTestStep *)stepToClickOnViewWithAccessibilityIdentifier:(NSString *)identifier;

- (TPTestStepResult)executeAndReturnError:(NSError **)error;

@property (nonatomic, readonly, copy) NSString *description;
@property (nonatomic, strong) TPElement *rootElement;

@end
