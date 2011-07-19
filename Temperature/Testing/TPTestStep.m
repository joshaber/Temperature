//
//  TPTestStep.m
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TPTestStep.h"
#import "TPElement.h"

@interface TPTestStep ()
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) TPTestStepExecutionBlock executionBlock;
@end


@implementation TPTestStep


#pragma mark API

@synthesize description;
@synthesize executionBlock;
@synthesize rootElement;

+ (TPTestStep *)stepWithDescription:(NSString *)description executionBlock:(TPTestStepExecutionBlock)block {
	NSParameterAssert(block != nil);
	
	TPTestStep *step = [[self alloc] init];
	step.executionBlock = block;
	step.description = description;
	return step;
}

+ (TPTestStep *)stepThatFails {
	return [self stepWithDescription:@"Always fails" executionBlock:^TPTestStepResult(TPTestStep *step, NSError **error) {
        TPTestCondition(NO, error, @"This test always fails");
    }];
}

+ (TPTestStep *)stepThatSucceeds {
	return [self stepWithDescription:@"Always succeeds" executionBlock:^TPTestStepResult(TPTestStep *step, NSError **error) {
        return TPTestStepResultSuccess;
    }];
}

+ (TPTestStep *)stepToWaitForViewWithAccessibilityIdentifier:(NSString *)identifier {
	return nil;
}

+ (TPTestStep *)stepToClickOnViewWithAccessibilityIdentifier:(NSString *)identifier {
	return [self stepWithDescription:[NSString stringWithFormat:@"Click on %@", identifier] executionBlock:^TPTestStepResult(TPTestStep *step, NSError **error) {
		TPElement *element = [step.rootElement childWithIdentifier:identifier];
		TPTestCondition(element != nil, error, @"Couldn't find element with identifier '%@'", identifier);
		
		[element performPressAction];
		
		return TPTestStepResultSuccess;
	}];
}

- (TPTestStepResult)executeAndReturnError:(NSError **)error {
	return self.executionBlock(self, error);
}

@end
