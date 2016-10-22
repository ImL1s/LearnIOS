//
//  ViewController.m
//  A03-LOL_ICON
//
//  Created by yushanglung on 2016/9/2.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"
#import "IconModel.h"
#import "ShowViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *array;
@property (nonatomic,assign) long currentIndex;

@end

@implementation ViewController

- (NSArray *)array{
    
    if(_array == NULL){
        _array =[IconModel heroGroupList];
    }
    
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 60;
    
//    NSArray *array = [IconModel heroGroupList];
//    IconModel *model = array[0];
//    NSLog([model icon]);
//    NSLog([model intro]);
//    NSLog([model name]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSLog(@"numberOfSectionsInTableView");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"numberOfRowsInSection");
    NSArray *arr = [self array];
    return arr.count;
//    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"cellForRowAtIndexPath");
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if(cell == NULL){
        
        NSLog(@"Cell == NULL");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myCell"];
    }
    
    
    IconModel *model = [self array][indexPath.row];
    [[cell textLabel] setText:[model name]];
    [[cell imageView] setImage:[UIImage imageNamed:model.icon]];
    [[cell detailTextLabel] setText:[model intro]];
    
//    NSLog([model icon]);
//    NSLog([model intro]);
//    NSLog([model name]);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"DidSelectItem");
    _currentIndex = indexPath.row;
    [self performSegueWithIdentifier:@"ToShowView" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"prepareForSegue");
    id target = segue.destinationViewController;
    IconModel *model = _array[_currentIndex];
//    [target setValue:model.name forKey:@"name"];
//    [target setValue:model.icon forKey:@"imgName"];
    [target setValue:model forKey:@"iconModel"];
}

//-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
//    
////    ShowViewController *controller = (ShowViewController *)sender;
////    [controller setValue1:@"asd"];
////    controller.value1 = @"dsa";
//    
//    
//}
@end
