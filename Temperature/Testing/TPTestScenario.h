//
//  TPTestScenario.h
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPTestStep.h"


@interface TPTestScenario : NSObject

+ (TPTestScenario *)scenarioWithDescription:(NSString *)description;

- (void)addStep:(TPTestStep *)step;

- (TPTestStepResult)executeAndReturnError:(NSError **)error;

@property (nonatomic, copy, readonly) NSString *description;

@end
