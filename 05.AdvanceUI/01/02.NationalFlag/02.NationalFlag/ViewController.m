//
//  ViewController.m
//  02.NationalFlag
//
//  Created by ImL1s-MacPro on 2016/10/22.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "FlagView.h"
#import "Flag.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (strong,nonatomic) NSArray *flagArray;

@end

@implementation ViewController

- (NSArray *) flagArray
{
    if(_flagArray == NULL)
    {
        _flagArray = [Flag flagList];
    }
    
    return _flagArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self picker].dataSource = self;
    [self picker].delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark asd

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flagArray.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view __TVOS_PROHIBITED
{
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"This is a label";
//    label.backgroundColor = [UIColor yellowColor];
//    label.frame =

//    return label;
    
    FlagView *v = [FlagView flagView];
    v.bounds = CGRectMake(0, 0, 200, 0);
    NSArray *flagArray = [self flagArray];
    Flag *flag = flagArray[row];
    [v setFlag:flag];
    
    return v;
}


@end
