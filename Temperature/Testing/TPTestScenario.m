//
//  TPTestScenario.m
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TPTestScenario.h"

@interface TPTestScenario ()
@property (nonatomic, copy) NSString *description;
@property (nonatomic, strong) NSMutableArray *steps;
@end


@implementation TPTestScenario


#pragma mark API

@synthesize description;
@synthesize steps;

+ (TPTestScenario *)scenarioWithDescription:(NSString *)description {
	TPTestScenario *scenario = [[self alloc] init];
	scenario.description = description;
	return scenario;
}

- (void)addStep:(TPTestStep *)step {
	[self.steps addObject:step];
}

- (TPTestStepResult)executeAndReturnError:(NSError **)error {
	for(TPTestStep *step in self.steps) {
		NSError *error = nil;
		TPTestStepResult result = [step executeAndReturnError:&error];
		if(result == TPTestStepResultFailure) {
			return result;
		}
	}
	
	return TPTestStepResultSuccess;
}

- (NSMutableArray *)steps {
	if(steps == nil) {
		self.steps = [NSMutableArray array];
	}
	
	return steps;
}

@end
