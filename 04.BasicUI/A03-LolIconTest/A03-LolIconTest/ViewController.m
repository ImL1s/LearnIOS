//
//  ViewController.m
//  A03-LolIconTest
//
//  Created by yushanglung on 2016/9/2.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"
#import "IconModel.h"

@interface ViewController ()<UITableViewDataSource>
{
    int _index;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *heroData;

@end

@implementation ViewController

- (NSArray *)heroData{
    
    if(_heroData == NULL){
        _heroData =[IconModel heroGroupList];
    }
    
    return _heroData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _index = 0;
    [[self tableView] setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    NSLog(@"numberOfSectionsInTableView");
////    return _heroData.count;
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSLog(@"numberOfRowsInSection");
    return [[self heroData] count];
//    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"cellForRowAtIndexPath");
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    NSLog([NSString stringWithFormat:@"%d",indexPath.row]);
    IconModel *model = _heroData[indexPath.row];
    cell.textLabel.text = model.intro;
//    cell.textLabel.text = [NSString stringWithFormat:@"%d",_index++];
    
    return cell;
}

@end
