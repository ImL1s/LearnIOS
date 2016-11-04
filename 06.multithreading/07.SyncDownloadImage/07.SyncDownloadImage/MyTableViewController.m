//
//  MyTableViewController.m
//  07.SyncDownloadImage
//
//  Created by ImL1s-MacPro on 2016/11/3.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "MyTableViewController.h"
#import "AppBean.h"

@interface MyTableViewController ()

@property(nonatomic,strong) NSArray *appArray;

@end

@implementation MyTableViewController

// 資料懶漢模式
- (NSArray *)appArray
{
    if(_appArray == nil)
    {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"apps" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mArray = [NSMutableArray array];
        
        for (NSDictionary *dic in array)
        {
            AppBean *bean = [AppBean appBeanWithDic:dic];
            [mArray addObject:bean];
        }
        
        _appArray = mArray;
    }
    
    return _appArray;
}


- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    static int index;
    NSLog(@"numberOfSectionInTableView %d",++index);
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appArray.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pCell"];
 
    AppBean *bean = self.appArray[indexPath.row];
    [cell textLabel].text = bean.name;
    cell.detailTextLabel.text = bean.download;
    
    // 模擬下載圖片過程(耗時)
    [NSThread sleepForTimeInterval:0.5];
    
    NSLog(@"Download...");
    
    NSURL *url = [NSURL URLWithString:bean.icon];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:data];
    
    cell.imageView.image = img;
    
 
 return cell;
    
 }

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
