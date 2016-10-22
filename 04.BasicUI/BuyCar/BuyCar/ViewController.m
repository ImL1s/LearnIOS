//
//  ViewController.m
//  BuyCar
//
//  Created by yushanglung on 2016/8/26.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) int index;

@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int count = 5;
    
    // 取得ScrollView的大小
    CGSize scrollViewSize = self.scrollView.frame.size;
    
    // 動態生成5個ImageView
    for (int i = 0; i < count; i++) {
        
        UIImageView *view = [[UIImageView alloc] init]; // UIImageView view = new UIImageView();
        NSString *imgName = [NSString stringWithFormat:@"img%02d",i];   //"img" + i;
        UIImage *image = [UIImage imageNamed:imgName];  // UIImage image = new UIImage(imgName);
        view.image = image;
        CGFloat cgFloat = scrollViewSize.width * i;
        view.frame = CGRectMake(cgFloat, 0, scrollViewSize.width, scrollViewSize.height);
        
        [_scrollView addSubview:view]; // scrollView.AddSubView(view);
        NSLog(imgName);
    }
    
    // 設定ScrollView的滾動範圍
    self.scrollView.contentSize = CGSizeMake(500*4, 0);
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    
    self.scrollView.showsHorizontalScrollIndicator = false;
    self.scrollView.showsVerticalScrollIndicator = false;
    self.scrollView.alwaysBounceVertical = false;
    self.scrollView.pagingEnabled = true;
    
    // 設定PageControl
    self.pageControl.numberOfPages = count;
    self.pageControl.currentPage = 0;
    
    self.scrollView.delegate = self;

}
- (IBAction)onClickLangueBtn:(UIButton *)sender {
}

- (IBAction)onClickLeftBtn {
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
    NSLog(@"%d",page);
}
- (IBAction)onBackBtnClick {
    [self dismissViewControllerAnimated:true completion:NULL];
}

@end
