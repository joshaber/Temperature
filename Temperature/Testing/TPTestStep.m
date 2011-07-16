//
//  TPTestStep.m
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TPTestStep.h"

@interface TPTestStep ()
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) TPTestStepExecutionBlock executionBlock;
@end


@implementation TPTestStep


#pragma mark API

@synthesize description;
@synthesize executionBlock;

+ (TPTestStep *)stepWithDescription:(NSString *)description executionBlock:(TPTestStepExecutionBlock)block {
	NSParameterAssert(block != nil);
	
	TPTestStep *step = [[self alloc] init];
	step.executionBlock = block;
	step.description = description;
	return step;
}

- (TPTestStepResult)executeAndReturnError:(NSError **)error {
	return self.executionBlock(self, error);
}

@end
