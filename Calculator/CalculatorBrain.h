//
//  CalculatorBrain.h
//  Calculator
//
//  Created by parfenov on 3/6/17.
//  Copyright © 2017 ru.aparfenov. All rights reserved.
//

#ifndef CalculatorBrain_h
#define CalculatorBrain_h
#import <Foundation/Foundation.h>



@interface CalculatorBrain : NSObject

- (void)setOperand: (NSNumber *)operand;
- (void)performOperation: (NSString *)symbol;
- (NSNumber *) getResult;

@end
#endif /* CalculatorBrain_h */
