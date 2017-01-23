//
//  YSPersonalViewController.m
//  07.個人詳情頁-標題縮放
//
//  Created by ImL1s-MacPro on 2016/11/18.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSPersonalViewController.h"

#define original_Y -244
#define original_height 200

@interface YSPersonalViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *topBg;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topBgHeightCons;

@end

@implementation YSPersonalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(244, 0, 0, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取得距離0點的滑動的距離
    float scrollY = scrollView.contentOffset.y;
    NSLog(@"%f",scrollY);
    
    // 取得實際的(當前距離-原點)滑動的距離
    float offset = scrollY - original_Y;
    NSLog(@"%f",offset);
    
    // 根據滑動的距離,增加or減少TopView的長度
    CGFloat currentBgHeight = original_height - offset;
    
    // 讓上方View最少有64的高度
    if(currentBgHeight < 64)
    {
        currentBgHeight = 64;
    }
    
    self.topBgHeightCons.constant = currentBgHeight;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"a";
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
