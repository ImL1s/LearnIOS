//
//  YSContactsTableViewController.m
//  7.Contacts
//
//  Created by ImL1s-MacPro on 2016/11/12.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSContactsTableViewController.h"
#import "YSAddViewController.h"
#import "YSEditViewController.h"

@interface YSContactsTableViewController () <UIActionSheetDelegate,UIAlertViewDelegate,YSAddViewControllerDelegate,YSEditViewControllerDelegate>

// 登出按鈕
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;

// 彈窗提示控制器
@property (strong,nonatomic) UIAlertController *alertController;

@property (strong,nonatomic) NSMutableArray *contactMutableArray;

@end

@implementation YSContactsTableViewController

#pragma mark get/set

- (NSString *) getCellIdentifier
{
    return @"contactCell";
}

- (NSMutableArray *)contactMutableArray
{
    if(_contactMutableArray == nil)
    {
        _contactMutableArray = [[NSMutableArray alloc] init];
    }
    
    return _contactMutableArray;
}

#pragma mark UIViewController method

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通訊錄",self.userName];
    
    [self.logoutBtn addTarget:self action:@selector(onLogoutBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self initAlertController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// 準備跳轉
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@",segue.identifier);
    
    if([segue.identifier isEqualToString:@"addSegue"])
    {
        YSAddViewController *addVC = segue.destinationViewController;
        //        addVC.contactsVC = self;
        addVC.delegate = self;
    }
    // 設定Edit模型為當前選中的模型
    else if([segue.identifier isEqualToString:@"editSegue"])
    {
        if([segue.destinationViewController isKindOfClass: [YSEditViewController class]])
        {
            YSEditViewController *editVC = segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            [editVC setModel:self.contactMutableArray[indexPath.row]];
            editVC.delegate = self;
        }
    }
}

#pragma mark other method

- (void) initAlertController
{
    __weak typeof(self) weakSelf = self;
    //    UIAlertController *alertController = self.alertController;
    
    // 提示框類型為下面彈出
    //    self.alertController = [UIAlertController alertControllerWithTitle:@"退出" message:@"退出後將重新登入" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 提示框類型為中間彈出
    self.alertController = [UIAlertController alertControllerWithTitle:@"退出" message:@"退出後將重新登入" preferredStyle:UIAlertControllerStyleAlert];
    
    // 加入確定按鈕與點擊行為
    UIAlertAction *logoutAction = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        UIViewController *rootController = weakSelf.navigationController.childViewControllers[0];
        [weakSelf.navigationController popToViewController:rootController animated:YES];
        
    }];
    
    // 加入取消按鈕與點擊行為
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"Cancel");
        NSLog(@"%@",self.alertController.textFields[0].text);
        
    }];
    
    // 加入提示中的文本匡
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"請輸入文字";
    }];
    
    [self.alertController addAction:logoutAction];
    [self.alertController addAction:cancelAction];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactMutableArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 從緩存池中拿取緩存物件,如果緩存物件不存在,便會去Nib(Storyboard)尋找Identifier相同的物件,都沒有則返回nil
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self getCellIdentifier]];
    
    //    if(cell == nil)
    //    {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[self getCellIdentifier]];
    //    }
    
    ContactModel *model = self.contactMutableArray[indexPath.row];
    
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.phone;
    
    return cell;
}


#pragma mark UIEvent

- (void) onLogoutBtnClick
{
    //    UIActionSheet *actionSheet =[[UIActionSheet alloc] initWithTitle:@"確定要登出?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"確定" otherButtonTitles:nil, nil];
    //
    //    [actionSheet showInView:self.view];
    
    //    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登出" message:@"確定登出?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"YES", nil];
    //    [alertView show];
    
    
    [self.navigationController presentViewController:self.alertController animated:YES completion:nil];
}

#pragma mark ActionSheel delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%d",(int)buttonIndex);
    
    if(buttonIndex == 0)
    {
        [self.navigationController popToViewController:self.navigationController.childViewControllers[0] animated:YES];
    }
}

#pragma mark AlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%d",(int)buttonIndex);
    
    if(buttonIndex == 1)
    {
        [self.navigationController popToViewController:self.navigationController.childViewControllers[0] animated:YES];
    }
}

#pragma mark My delegate

- (void) addContactVC:(YSAddViewController *)addViewController contactModel:(ContactModel *)contactModel
{
    NSLog(@"addContactVC");
    //    self.contactModel = contactModel;
    [self.contactMutableArray addObject:contactModel];
    
    [self.tableView reloadData];
    NSLog(@"Name:%@ Phone:%@",contactModel.name,contactModel.phone);
}

- (void)onEdited
{
    [self.tableView reloadData];
}

// 手動unwind時調用傳回資料
//- (IBAction)unwindSegue:(UIStoryboardSegue *)unwindSegue
//{
//    NSLog(@"unwindSegue");
//    NSLog(@"%@/%@",self.contactModel.name,self.contactModel.phone);
//}



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
