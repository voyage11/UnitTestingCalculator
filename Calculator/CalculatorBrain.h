//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Ricky on 3/30/14.
//  Copyright (c) 2014 Calculator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
-(void) pushOperand:(double) operand;
-(double) performOperation:(NSString*)operation;
-(double) popOperand;
@end
