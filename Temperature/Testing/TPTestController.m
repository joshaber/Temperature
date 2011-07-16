//
//  TPTestController.m
//  Temperature
//
//  Created by Josh Abernathy on 7/16/11.
//  Copyright 2011 Maybe Apps, LLC. All rights reserved.
//

#import "TPTestController.h"
#import "TPTestScenario.h"
#import "TPApplication.h"

@interface TPTestController ()
@property (nonatomic, strong) NSMutableArray *scenarios;
@property (nonatomic, strong) TPApplication *application;
@end


@implementation TPTestController

- (id)init {
    self = [super init];
    if(self == nil) return nil;
	
	[self initializeTestScenarios];
    
    return self;
}


#pragma mark API

@synthesize scenarios;
@synthesize application;

+ (id)sharedInstance {
	return [[self alloc] init];
}

- (void)initializeTestScenarios {
	
}

- (void)addScenario:(TPTestScenario *)scenario {
	[self.scenarios addObject:scenario];
}

- (void)startTesting {
	for(TPTestScenario *scenario in self.scenarios) {
		NSError *error = nil;
		TPTestStepResult result = [scenario executeAndReturnError:&error];
		if(result == TPTestStepResultFailure) {
			NSLog(@"FAILED - %@", error);
		} else {
			NSLog(@"PASSED");
		}
	}
}

- (NSMutableArray *)scenarios {
	if(scenarios == nil) {
		self.scenarios = [NSMutableArray array];
	}
	
	return scenarios;
}

- (TPApplication *)application {
	if(application == nil) {
		self.application = [TPApplication applicationWithCurrentApplication];
	}
	
	return application;
}

@end
