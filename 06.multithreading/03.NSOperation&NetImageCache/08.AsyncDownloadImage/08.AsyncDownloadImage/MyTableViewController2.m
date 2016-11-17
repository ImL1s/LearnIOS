//
//  MyTableViewController2.m
//  08.AsyncDownloadImage
//
//  Created by ImL1s-MacPro on 2016/11/4.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "MyTableViewController2.h"
#import "AppBean.h"

@interface MyTableViewController2 ()

@property(nonatomic,strong) NSArray *appArray;

@property(nonatomic,strong)NSOperationQueue *queue;

@property(nonatomic,strong) NSMutableDictionary *opCache;

@property(nonatomic,strong) NSMutableDictionary *imgCache;

@end

@implementation MyTableViewController2

#pragma mark - get method

// (GET)app資料懶漢模式
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

// (GET)線程併發隊列
- (NSOperationQueue *) queue
{
    if(_queue == NULL)
    {
        _queue = [[NSOperationQueue alloc]init];
    }
    
    return _queue;
}

// (GET)operation字典,防止多次下載同一張圖片
- (NSMutableDictionary *)opCache
{
    if(_opCache == NULL)
    {
        _opCache = [NSMutableDictionary dictionary];
    }
    return _opCache;
}

// (GET)圖片緩存,方便釋放記憶體
- (NSMutableDictionary *)imgCache
{
    if(_imgCache == NULL)
    {
        _imgCache = [NSMutableDictionary dictionary];
    }
    return _imgCache;
}

#pragma mark - ViewController method

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self.queue cancelAllOperations];
    [self.opCache removeAllObjects];
    [self.imgCache removeAllObjects];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// UITableView - numberOfRowsInSection
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appArray.count;
}

// UITableView - cellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppBean *bean = self.appArray[indexPath.row];
    UITableViewCell *cell = [self getAndSetTableCell:tableView data:bean];

    
    // 檢查圖片緩存
    if(self.imgCache[bean.icon] == NULL)
    {
        
        // 正在執行異步下載操作
        if(self.opCache[bean.icon])
        {
            NSLog(@"該圖片正在下載中...");
        }
        // 開始執行異步下載操作
        else
        {
            NSLog(@"開始下載...");
            [self downloadImage:cell appBean:bean xx:indexPath];
        }
    }
    // 從緩存設定圖片
    else
    {
        [self cacheImage:cell data:bean];
    }
    

    
    
    return cell;
    
}

- (void) downloadImage:(UITableViewCell *)cell appBean:(AppBean *)bean xx:(NSIndexPath *)indexPath
{
    // 1.必須先給一張圖片把ImageView撐開,否則原本沒有圖片時是小到看不見的
    // 2.不設置的話必須等到調用UITableViewCell.layoutSubView()方法,才會顯示
    // 3.點擊UITableViewCell時,就會調用layoutSubView(),所以不設定ImageView.image必須等到滾動 || 點擊才會顯示圖片
    cell.imageView.image = [UIImage imageNamed:@"48x48"];
    
    // 異步下載圖片
    NSBlockOperation *downloadOP = [NSBlockOperation blockOperationWithBlock:^{
        
        // 模擬下載圖片過程(耗時)
        [NSThread sleepForTimeInterval:3];
        
        NSLog(@"Download...");
        
        NSURL *url = [NSURL URLWithString:bean.icon];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        
        // 將圖片儲存在Model層
//        bean.imageCache = img;
        
        // 將圖片除存在緩存中
        [self.imgCache setValue:img forKey:bean.icon];
        
        [[NSOperationQueue mainQueue]addOperationWithBlock:^
         {
             // 下載完畢,移除緩存防止下載失敗圖片為空,但是opearion緩存還有此筆操作,造成無法顯示圖片
             [self.opCache removeObjectForKey:bean.icon];
             
             // reload指定的row,會在調用一次 cellForRowAtIndexPath
             [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
         }];
        
    }];
    
    // 加入緩存,防止重複下載
    [self.opCache setValue:downloadOP forKey:bean.icon];
    
    // 加入隊列,執行異步下載
    [self.queue addOperation:downloadOP];
    
    NSLog(@"操作數量---->%tu",[[self queue] operationCount]);
}

// 緩存UIImage
- (void) cacheImage:(UITableViewCell *)cell data:(AppBean *)bean
{
    NSLog(@"設定緩存的圖片");
    //        cell.imageView.image = bean.imageCache;
    cell.imageView.image = self.imgCache[bean.icon];
}

// 取得UITableViewCell
- (UITableViewCell *) getAndSetTableCell:(UITableView *)tableView data:(AppBean *)bean
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pCell"];
    [cell textLabel].text = bean.name;
    cell.detailTextLabel.text = bean.download;
    
    return cell;
}


@end
