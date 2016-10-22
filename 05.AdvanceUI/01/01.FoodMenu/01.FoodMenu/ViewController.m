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

@property (weak, nonatomic) IBOutlet UITextView *fruitValue;

@property (weak, nonatomic) IBOutlet UITextView *stapleValue;

@property (weak, nonatomic) IBOutlet UITextView *drinkValue;

@property (weak, nonatomic) IBOutlet UIButton *randomBtn;
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
    
    [self picker].delegate = self;
    [self picker].dataSource = self;
    
    
    for (int i = 0; i < self.foodArray.count; i++)
    {
        [self pickerView:self.picker didSelectRow:0 inComponent:i];
    }
    
    [self.randomBtn addTarget:self action:@selector(onRandomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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

// 設定PickerView內容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED
{
    NSArray *rowArray = [self foodArray][component];
    
    return rowArray[row];
}

// 選中PickerView時觸發
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //NSLog(@"Row: %d, Component:%d",row,component);
    
    NSString *value = self.foodArray[component][row];
    
    switch (component)
    {
        case 0:
            [self fruitValue].text = value;
            break;
            
        case 1:
            [self stapleValue].text = value;
            break;
            
        case 2:
            [self drinkValue].text = value;
            break;
            
        default:
            break;
    }
}


- (void) onRandomBtnClick
{
    NSLog(@"OnClick");
    
    for (int i = 0; i < self.foodArray.count; i++)
    {
        NSArray *column = self.foodArray[i];
        
        int random = -1;
        int oldSelect = (int)[self.picker selectedRowInComponent:i];
        
        // 防止重複的隨機數
        while (oldSelect == random)
        {
            random = arc4random_uniform((int)column.count);
        }
        
        // 設定TextView的顯示
        [self pickerView:self.picker didSelectRow:random inComponent:i];
        
        // 設定PickerView 選中的Row
        [self.picker selectRow:random inComponent:i animated:YES];
    }
    
    
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view __TVOS_PROHIBITED
//{
//    return nil;
//}

@end
