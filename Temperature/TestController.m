//
//  TestController.m
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TestController.h"
#import "TPTestScenario.h"
#import "TPApplication.h"


@implementation TestController


#pragma mark TPTestController

- (void)initializeTestScenarios {
	TPTestScenario *scenario = [TPTestScenario scenarioWithDescription:@"First test"];
//	[scenario addStep:[TPTestStep stepWithDescription:@"my-button" executionBlock:^TPTestStepResult(TPTestStep *step, NSError *__autoreleasing *error) {
//		return [[TPApplication applicationWithCurrentApplication].mainWindow childWithIdentifier:@"my-button"] != nil ? TPTestStepResultSuccess : TPTestStepResultFailure;
//	}]];
//	
	[scenario addStep:[TPTestStep stepWithDescription:@"my-view" executionBlock:^TPTestStepResult(TPTestStep *step, NSError *__autoreleasing *error) {
		return [[TPApplication applicationWithCurrentApplication].mainWindow childWithIdentifier:@"my-view"] != nil ? TPTestStepResultSuccess : TPTestStepResultFailure;
	}]];
//	
//	[scenario addStep:[TPTestStep stepWithDescription:@"pretty-button" executionBlock:^TPTestStepResult(TPTestStep *step, NSError *__autoreleasing *error) {
//		return [self.application.mainWindow childWithIdentifier:@"pretty-button"] != nil ? TPTestStepResultSuccess : TPTestStepResultFailure;
//	}]];

//	[scenario addStep:[TPTestStep stepWithDescription:@"pretty-button" executionBlock:^TPTestStepResult(TPTestStep *step, NSError *__autoreleasing *error) {
//		return [self.application.mainWindow childWithPath:@"my-view/pretty-button"] != nil ? TPTestStepResultSuccess : TPTestStepResultFailure;
//	}]];
	
	[self addScenario:scenario];
}

@end
