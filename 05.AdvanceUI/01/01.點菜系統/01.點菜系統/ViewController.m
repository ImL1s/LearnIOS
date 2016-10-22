//
//  ViewController.m
//  01.點菜系統
//
//  Created by yushanglung on 2016/9/20.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(strong,nonatomic) NSArray *foodArray;

@end

@implementation ViewController

- (NSArray *) foodArray{
    
    if(_foodArray == nil){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"];
        _foodArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _foodArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIPickerViewDeataSource
// returns the number of 'columns' to display. 行數
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foodArray.count;
//    return 2;
}

// returns the # of rows in each component.. 列數
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return ((NSArray *)(self.foodArray[component])).count;
//    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *singleFoodArray = self.foodArray[component];
    return singleFoodArray[row];
//    if(component == 0 && row == 0) return @"ccc";
//    return @"abc";
}


@end
