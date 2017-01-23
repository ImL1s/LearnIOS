//
//  ViewController.m
//  03.省市連動
//
//  Created by ImL1s-MacPro on 2016/10/23.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (strong,nonatomic) NSArray *provincesArray;

@property (assign,nonatomic) NSInteger currentIndex;

@end


@implementation ViewController

- (NSArray *) provincesArray
{
    if(_provincesArray == NULL)
    {
        _provincesArray = [Province provinceList];
    }
    return _provincesArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (IBAction)onBackClick:(id)sender {
}

#pragma mark UIPickerViewDelegate 代理

// 顯示資料
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        Province *province = self.provincesArray[row];
        
        return province.name;
    }
    
    Province *province = [self provincesArray][self.currentIndex];
    return province.cities[row];
}

// 選擇UIPickerView時的動作
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
    {
        self.currentIndex = row;
        
        [self.picker reloadComponent:1];
        
        // 每次選擇省份時將市區歸到第一個
        [[self picker] selectRow:0 inComponent:1 animated:true];

    }
}

#pragma mark UIPickerViewDataSource 資料來源

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
    {
        return self.provincesArray.count;
    }
    
    Province *province = self.provincesArray[self.currentIndex];
    return province.cities.count;
}



@end
