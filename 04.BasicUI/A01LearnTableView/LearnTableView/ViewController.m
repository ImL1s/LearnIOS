//
//  ViewController.m
//  LearnTableView
//
//  Created by yushanglung on 2016/8/29.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 返回指定組有多少列(row)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

// 返回TableView裡有多少個Sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

// 決定每一列(row)的資料
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if(indexPath.section == 0){
        
        if(indexPath.row == 0){
        cell.textLabel.text = @"第一名";
        }
        else{
            cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        }
    }
    else if(indexPath.section == 1){
        
        if(indexPath.row == 0){
            cell.textLabel.text = @"第三名";
        }
        else{
            cell.textLabel.text = @"第四名";
        }
    }
    else if(indexPath.section == 2){
        
        if(indexPath.row == 0){
            cell.textLabel.text = @"第5名";
        }
        else{
            cell.textLabel.text = @"第6名";
        }
    }
    return cell;
}

@end
