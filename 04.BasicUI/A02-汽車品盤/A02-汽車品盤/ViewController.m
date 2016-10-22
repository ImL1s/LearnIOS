//
//  ViewController.m
//  A02-汽車品盤
//
//  Created by yushanglung on 2016/8/30.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"
#import "MyCarGroup.h"
#import "MyTestViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSArray *data;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
    UIButton *b = [[UIButton alloc] init];
    [b addTarget:NULL action:@selector(onClickBtn:) forControlEvents:UIControlEventTouchDown];
    
    b.frame = CGRectMake(0, 0, 100, 100);
    [b setEnabled:true];
    [b setTitle:@"Click me" forState:UIControlStateNormal];
    
    [b setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [b setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [b setTitleColor:[UIColor redColor] forState:UIControlStateFocused];
    [b setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.tableView addSubview:b];
    
    _data = [MyCarGroup carGroupList];
    
//    NSString *str = [((MyCarGroup *)([MyCarGroup carGroupList][0])) desc];
//    NSLog(str);
//    [MyCarGroup carGroupList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

- (void)initTableView{
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
}

- (void)onClickBtn:(UIButton *)sender{
    NSLog(@"onClickBtn");
//    UIViewController *control = [[MyTestViewController alloc] init];
//    [self presentModalViewController:control animated:YES];
    
//    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    MyTestViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"MyView"];
//    [self.navigationController pushViewController:controller animated:YES];
    
    [self performSegueWithIdentifier:@"jump1" sender:self];
    
//    [[self view] addSubview:[MyTestViewController alloc]];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    MyCarGroup *carGroup = _data[section];
    
    return [carGroup cars].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    MyCarGroup *carGroup = _data[indexPath.section];
    
    cell.textLabel.text = carGroup.cars[indexPath.row];
    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"prepareForSegue");
    id target = segue.destinationViewController;
    [target setValue:@"321" forKey:@"value1"];
}

@end
