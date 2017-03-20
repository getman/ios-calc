//
//  CalculatorBrain.m
//  Calculator
//
//  Created by parfenov on 3/6/17.
//  Copyright © 2017 ru.aparfenov. All rights reserved.
//

/**UI independent part*/
#import "CalculatorBrain.h"

typedef enum {
    Constant = 1,
    UnaryOperation,
    BinaryOperation,
    Equals
} OperationNames;

//function pointers
/**returns int, takes int*/
typedef NSNumber* (*FuncPtr) (NSNumber*, NSNumber*);
typedef double (*FuncPtrDoubleMult) (double, double);
struct PendingBinaryOperationInfo {
    __unsafe_unretained NSString *someStr;
    double firstOperand;
    FuncPtrDoubleMult *multiDouble;
};

@interface CalculatorBrain ()

@end

@implementation CalculatorBrain
//--------Fields------------
double accumulator = 0.0;
NSDictionary *operations;
/**when we are waiting a binary operation*/
struct PendingBinaryOperationInfo info;

//-----------Functions-----------
//-(NSNumber *) multiply: (NSNumber *)num1 numb2:(NSNumber *)num2 {
//    return [NSNumber numberWithDouble: ([num1 doubleValue] * [num2 doubleValue])];
//}

double multiplyDouble(double i1, double i2) {
    return i1 * i2;
}

-(id)init {
    if (self = [super init]) {
//        info.func1 = multiply;
//        info.multiDouble = &multiplyDouble;
//        operations = @{
//                    @"pi": OperationNames.Constant,
//                    @"e": OperationNames.Constant,
//                    @"sqrt": Operation.UnaryOperation};
    }
    return self;
}



- (void)setOperand: (NSNumber *)operand {
    accumulator = [operand doubleValue];
}
- (void)performOperation: (NSString *)symbol {
//    double constant = [operations[symbol] doubleValue];
    NSLog(@"Going to perform operation");
//    if (constant) {
        if ([symbol isEqualToString:@"pi"]) {
            accumulator = M_PI;
        } else if ([symbol isEqualToString:@"sqrt"]) {
            accumulator = sqrt(accumulator);
        } else if ([symbol isEqualToString:@"*"]) {
            info.multiDouble = multiplyDouble;
            info.firstOperand = accumulator;
        } else if ([symbol isEqualToString:@"="]) {
            accumulator = (*info.multiDouble)(info.firstOperand, accumulator);
        }
//    }
}
- (NSNumber *) getResult {
    return [NSNumber numberWithDouble: accumulator];
}



@end