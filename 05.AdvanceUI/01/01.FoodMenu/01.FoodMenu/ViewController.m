//
//  ViewController.m
//  01.FoodMenu
//
//  Created by yushanglung on 2016/10/20.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@property (strong,nonatomic) NSArray *foodArray;

@end

@implementation ViewController

- (NSArray *)foodArray
{
    if(_foodArray == NULL)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"];
        _foodArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _foodArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self picker].delegate = self;
    [self picker].dataSource = self;
    
    NSLog(@"===========");
    NSArray *array = [self foodArray];
//    NSLog([self foodArray]);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return [[self foodArray] count];
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *rowArray = [self foodArray][component];
    return rowArray.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED
{
    NSArray *rowArray = [self foodArray][component];
    
    return rowArray[row];
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view __TVOS_PROHIBITED
//{
//    return nil;
//}

@end
