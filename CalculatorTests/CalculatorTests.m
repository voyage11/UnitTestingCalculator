//
//  CalculatorTests.m
//  CalculatorTests
//
//  Created by Ricky on 3/30/14.
//  Copyright (c) 2014 Calculator. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalculatorBrain.h"

@interface CalculatorTests : XCTestCase

@property (nonatomic,strong) CalculatorBrain * brain;

@end

@implementation CalculatorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.brain = [[CalculatorBrain alloc]init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddition
{
    [self.brain pushOperand:[@"21" doubleValue]];
    [self.brain pushOperand:[@"63" doubleValue]];
    double result = [self.brain performOperation:@"+"];
    XCTAssertTrue(result==84, @"Addition Fail");
}

- (void)testSubtraction
{
    [self.brain pushOperand:[@"100" doubleValue]];
    [self.brain pushOperand:[@"90" doubleValue]];
    double result = [self.brain performOperation:@"-"];
    XCTAssertTrue(result==10, @"Subtraction Fail");
}

- (void)testProduction
{
    [self.brain pushOperand:[@"3" doubleValue]];
    [self.brain pushOperand:[@"5" doubleValue]];
    double result = [self.brain performOperation:@"*"];
    XCTAssertTrue(result==15, @"Production Fail");
}

- (void)testDivision
{
    [self.brain pushOperand:[@"77" doubleValue]];
    [self.brain pushOperand:[@"7" doubleValue]];
    double result = [self.brain performOperation:@"/"];
    XCTAssertTrue(result==11, @"Division Fail");
}



@end
