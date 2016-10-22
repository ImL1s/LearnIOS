//
//  ViewController.m
//  A04-汽車數據升級
//
//  Created by yushanglung on 2016/9/7.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"
#import "Car.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic) NSArray *carGroupArray;

@end

@implementation ViewController

static NSString *RESOURCESID = @"myCell1";

- (NSArray *) carGroupArray{
    
    if(_carGroupArray == nil){
        _carGroupArray = [CarGroup array];
    }
    
    return _carGroupArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    self.tableView.
    
    
    NSArray *ar = [CarGroup array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [[self carGroupArray] count];
//    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 1;
    CarGroup *carGroup = [self carGroupArray][section];
    return carGroup.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RESOURCESID];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RESOURCESID];
    CarGroup *g =[CarGroup array][[indexPath section]];
    cell.textLabel.text = ((Car *)(g.cars[indexPath.row])).name;
    
    
    return cell;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
//    [view addSubview:label];
//    CarGroup *carGroup = [self carGroupArray][section];
//    label.text = carGroup.title;
//    
//    [tableView addSubview:label];
//    return view;
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    CarGroup *group = _carGroupArray[section];
    return group.title;
    
}

@end
