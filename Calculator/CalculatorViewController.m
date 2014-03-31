//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Ricky on 3/30/14.
//  Copyright (c) 2014 Calculator. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfTyping;
@property (nonatomic,strong) CalculatorBrain * brain;
@property (nonatomic) BOOL dotNotation;
@property (nonatomic) BOOL firstEntered;

@property (weak, nonatomic) IBOutlet UILabel *displayLbl;
@property (weak, nonatomic) IBOutlet UILabel *enteredLbl;

@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button0;

@property (weak, nonatomic) IBOutlet UIButton *buttonDot;

@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;
@property (weak, nonatomic) IBOutlet UIButton *buttonMinus;
@property (weak, nonatomic) IBOutlet UIButton *buttonMultiply;
@property (weak, nonatomic) IBOutlet UIButton *buttonDivide;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property (weak, nonatomic) IBOutlet UIButton *buttonEnter;

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.button9.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button9.layer.borderWidth = 1.0f;
    self.button8.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button8.layer.borderWidth = 1.0f;
    self.button7.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button7.layer.borderWidth = 1.0f;
    self.button6.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button6.layer.borderWidth = 1.0f;
    self.button5.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button5.layer.borderWidth = 1.0f;
    self.button4.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button4.layer.borderWidth = 1.0f;
    self.button3.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button3.layer.borderWidth = 1.0f;
    self.button2.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button2.layer.borderWidth = 1.0f;
    self.button1.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button1.layer.borderWidth = 1.0f;
    self.button0.layer.borderColor = [UIColor whiteColor].CGColor;
    self.button0.layer.borderWidth = 1.0f;
    
    self.buttonPlus.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonPlus.layer.borderWidth = 1.0f;
    self.buttonMinus.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonMinus.layer.borderWidth = 1.0f;
    self.buttonMultiply.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonMultiply.layer.borderWidth = 1.0f;
    self.buttonDivide.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonDivide.layer.borderWidth = 1.0f;
    self.buttonClear.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonClear.layer.borderWidth = 1.0f;
    self.buttonEnter.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonEnter.layer.borderWidth = 1.0f;
    
    self.buttonDot.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonDot.layer.borderWidth = 1.0f;
    
}

- (CalculatorBrain*) brain
{
    if(!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;
}


- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString* digit = sender.currentTitle; // [sender
    
    if(!(self.dotNotation&&[digit isEqualToString:@"."]))
    {
        if([digit isEqualToString:@"."])
            self.dotNotation=YES;
        
        if(self.userIsInTheMiddleOfTyping)//MUST have self
            self.displayLbl.text = [self.displayLbl.text stringByAppendingString:digit];
        else
        {
            self.displayLbl.text=digit;
            self.userIsInTheMiddleOfTyping=YES;
        }
    }
}



- (IBAction)operationPressed:(UIButton *)sender {
    
    if([sender.currentTitle isEqualToString:@"C"])
    {
        self.displayLbl.text = @"0";
        self.enteredLbl.text=@"0";
        self.brain = nil;
    }
    else
    {
        if(self.userIsInTheMiddleOfTyping) {
            [self enterPressed:nil];
        }
        self.enteredLbl.text=[self.enteredLbl.text stringByAppendingString:@" "];
        self.enteredLbl.text=[self.enteredLbl.text stringByAppendingString:sender.currentTitle];
        
        double result = [self.brain performOperation:sender.currentTitle];
        NSString * resultString = [NSString stringWithFormat:@"%g",result];
        self.displayLbl.text = resultString;
    }
}


- (IBAction)enterPressed:(UIButton *)sender {
    
    [self.brain pushOperand:[self.displayLbl.text doubleValue]];
    
    if(self.firstEntered)
    {
        self.enteredLbl.text=[self.enteredLbl.text stringByAppendingString:@" "];
        self.enteredLbl.text=[self.enteredLbl.text stringByAppendingString:self.displayLbl.text];
    }
    else
        self.enteredLbl.text=self.displayLbl.text;
    
    self.userIsInTheMiddleOfTyping = NO;
    self.dotNotation=NO;
    self.firstEntered=YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
