//
//  ViewController.h
//  Calculator
//
//  Created by parfenov on 3/3/17.
//  Copyright © 2017 ru.aparfenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface ViewController : UIViewController {
    
}

- (IBAction)touchDigit:(UIButton *)sender;

- (IBAction)performOperatuion:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *display;



@end

