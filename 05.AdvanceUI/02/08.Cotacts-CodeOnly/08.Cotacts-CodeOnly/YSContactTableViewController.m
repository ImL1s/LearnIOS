//
//  YSContactTableViewController.m
//  08.Cotacts-CodeOnly
//
//  Created by ImL1s-MacPro on 2016/11/15.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSContactTableViewController.h"
#import "YSAddViewController.h"
#import "YSEditViewController.h"

@interface YSContactTableViewController ()<YSAddViewControllerDelegate>

@property(nonatomic,strong) NSMutableArray *contactModelMArray;

@end

@implementation YSContactTableViewController

#pragma mark get/set

- (NSMutableArray *)contactModelMArray
{
    if(_contactModelMArray == nil)
    {
        _contactModelMArray = [NSMutableArray array];
    }
    
    return _contactModelMArray;
}

#pragma mark UIViewController method

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通訊錄",self.name];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登出" style:UIBarButtonItemStylePlain target:self action:@selector(onLogoutClick)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"新增" style:UIBarButtonItemStylePlain target:self action:@selector(onAddBtnClick)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onReceiveEditedContact) name:@"onEditedContact" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


#pragma mark UI process method

- (void) onAddBtnClick
{
    YSAddViewController *addVC = [[YSAddViewController alloc] init];
    addVC.delegate = self;
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)onLogoutClick
{
    UIAlertController *alertC = [[UIAlertController alloc] init];
    alertC.title = @"確定登出?";
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"cancel");
        
    }];
    
    [alertC addAction:confirmAction];
    [alertC addAction:cancelAction];
    
    [self presentViewController:alertC animated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactModelMArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *S_Identifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:S_Identifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:S_Identifier];
    }
    
    NSInteger index = indexPath.row;
    YSContactModel *model = self.contactModelMArray[index];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.phone;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSContactModel *model = self.contactModelMArray[indexPath.row];
    YSEditViewController *editVC = [[YSEditViewController alloc] init];
    editVC.model = model;
    
    [self.navigationController pushViewController:editVC animated:YES];
    
    NSLog(@"didSelectRowAtIndexPath");
}


#pragma mark - YSAdd view controller delegate

- (void) addViewController:(YSAddViewController *)controller onAddContactModel:(YSContactModel *)model;
{
    [self.contactModelMArray addObject:model];
    [self.tableView reloadData];
}


#pragma mark - observer method

- (void) onReceiveEditedContact
{
    [self.tableView reloadData];
}



@end
