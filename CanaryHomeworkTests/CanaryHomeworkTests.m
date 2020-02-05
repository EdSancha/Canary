//
//  CanaryHomeworkTests.m
//  CanaryHomeworkTests
//
//  Created by Eduardo Diaz Sancha on 2/5/20.
//  Copyright © 2020 Michael Schroeder. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ReadingViewModel.h"
#import "Reading+CoreDataClass.h"

@interface CanaryHomeworkTests : XCTestCase

@end

@implementation CanaryHomeworkTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    /// We need to create a testing structure to test these objects. More as our models come from CoreData so we need to mock those too. The steps for that would be creating an in-memory ManagedContext
    /// mocking network calls, and finally comparing results with expected data
    /*
    Device *mockDevice = [Device new];
    mockDevice.name = @"Test device";
    mockDevice.deviceID = @"1";
    Reading *r1 = [Reading new];
    r1.type = @"temp";
    r1.value = @35;
    
    Reading *r2 = [Reading new];
    r2.type = @"temp";
    r2.value = @35;
    
    mockDevice.readings = [[NSSet alloc] initWithObjects:r1,r2, nil];
    
    ReadingViewModel *rvm = [[ReadingViewModel alloc] initWithDevice:mockDevice];
    [rvm getReadingsWithCompletionBlock:^(BOOL success, id  _Nonnull readings) {
    
        
    }];
     */
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
