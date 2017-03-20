//
//  ViewController.m
//  Calculator
//
//  Created by parfenov on 3/3/17.
//  Copyright © 2017 ru.aparfenov. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()

@end

@implementation ViewController
bool userIsInTheMiddleOfTyping = false;
CalculatorBrain *brain;// = [[CalculatorBrain alloc] init];

//-(id)init {
//    if (self = [super init]) {
//        brain = [[CalculatorBrain alloc] init];
//        NSLog(@"Building a brain");
//    }
//    return self;
//}

//-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        brain = [[CalculatorBrain alloc] init];
//        NSLog(@"Building a brain");
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    brain = [[CalculatorBrain alloc] init];
    NSLog(@"Building a brain");
}

- (IBAction)touchDigit:(UIButton *)sender {
    NSString *digit = ((UIButton*)sender).currentTitle;
    printf("HEllo world %s", [digit UTF8String]);
    NSString* textCurrentlyInDisplay = _display.text;
    if (!userIsInTheMiddleOfTyping) {
        _display.text = digit;
    } else {
        _display.text = [NSString stringWithFormat: @"%@%@", textCurrentlyInDisplay, digit];
    }
    userIsInTheMiddleOfTyping = true;
}

- (IBAction)performOperatuion:(UIButton *)sender {
    userIsInTheMiddleOfTyping = false;
    NSString *currentTitle = ((UIButton*)sender).currentTitle;
    if (currentTitle != nil) {
        [brain setOperand: [NSNumber numberWithDouble: [_display.text doubleValue]]];
        [brain performOperation: currentTitle];
        [self setDisplayValue: [brain getResult]];
    }
}

-(NSNumber *) getDisplayValue {
    return [NSNumber numberWithDouble: [_display.text doubleValue]];
}

-(void) setDisplayValue: (NSNumber*) newValue{
    _display.text = [newValue stringValue];
}
@end
