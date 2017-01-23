//
//  LockView.m
//  07.手勢解鎖
//
//  Created by ImL1s-MacPro on 2016/12/9.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "LockView.h"

@interface LockView()

@property(nonatomic,strong) NSMutableArray *selectBtnArray;

@property(nonatomic,strong) NSMutableString *selectNumsMutableString;

@property(nonatomic,assign) CGPoint curentPoint;

@end


@implementation LockView

- (NSMutableArray *)selectBtnArray
{
    if(_selectBtnArray == nil)
    {
        _selectBtnArray = [NSMutableArray array];
    }
    
    return _selectBtnArray;
}

- (NSMutableString *)selectNumsMutableString
{
    if(_selectNumsMutableString == nil)
    {
        _selectNumsMutableString = [NSMutableString string];
    }
    
    return _selectNumsMutableString;
}

- (NSString *)userDefaultsPasswordKey
{
    return self.delegate == nil?@"_gPassword9527" : [self.delegate lockViewUserDefaultsPasswordKey];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setUp];
}

// 取得觸摸位置
- (CGPoint)touchPointOnView:(NSSet<UITouch *> *)touches
{
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}

// 取得觸摸位置上的按鈕
- (UIButton *)buttonOnPoint:(CGPoint) point
{
    for (int i = 0; i < self.subviews.count; i++)
    {
        if(CGRectContainsPoint(self.subviews[i].frame, point))
            return self.subviews[i];
    }
    return nil;
}


// 觸摸開始
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 取得當前觸摸在本View上的位置
    CGPoint touchPoint = [self touchPointOnView:touches];
    
    // 取得當前在觸摸位置上的按鈕,如果沒有返回nil
    UIButton *btnOnPoint = [self buttonOnPoint:touchPoint];
    if(btnOnPoint != nil && !btnOnPoint.isSelected)
    {
        [self.selectBtnArray addObject:btnOnPoint];
        btnOnPoint.selected = YES;
        
        [self setNeedsDisplay];
    }
    
    self.curentPoint = touchPoint;
}


// 觸摸移動
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [self touchPointOnView:touches];
    
    UIButton *btnOnPoint = [self buttonOnPoint:touchPoint];
    if(btnOnPoint != nil && !btnOnPoint.isSelected)
    {
        [self.selectBtnArray addObject:btnOnPoint];
        btnOnPoint.selected = YES;
    }
    
    self.curentPoint = touchPoint;
    [self setNeedsDisplay];
}

// 觸摸結束
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (int i = 0; i < self.selectBtnArray.count; i++)
    {
        UIButton *selectBtn = self.selectBtnArray[i];
        selectBtn.selected = NO;
        [self.selectNumsMutableString appendString:[NSString stringWithFormat:@"%ld",selectBtn.tag]];
    }

    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:self.userDefaultsPasswordKey];
    
    // 第一次輸入
    if(!password || [password isEqualToString:@""])
    {
        if(self.delegate != nil)
        {
            [self.delegate lockViewFirstSetPassword:self.selectNumsMutableString];
        }
        
    }
    // 輸入錯誤
    else if(![password isEqualToString:self.selectNumsMutableString])
    {
        if(self.delegate != nil)
        {
            [self.delegate lockViewErrorPassword:password];
        }
    }
    // 輸入成功
    else if([password isEqualToString:self.selectNumsMutableString])
    {
        if(self.delegate != nil) [self.delegate lockViewCorrectPassword:password];
    }
    
    NSLog(@"RealPassword: %@",password);
    NSLog(@"CurrentPassword %@", self.selectNumsMutableString);
    
    self.selectNumsMutableString = nil;
    [self.selectBtnArray removeAllObjects];
    [self setNeedsDisplay];
}

// 設定按鈕
- (void)setUp
{
    for (int i = 0; i < 9; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:@"gesture_node_selected"] forState:UIControlStateSelected];
        
        button.userInteractionEnabled = NO;
        
        button.tag = i;
        
        [self addSubview:button];
    }
    
    self.backgroundColor = [UIColor clearColor];
}

// 重新排列子元素 會在addSubView時調用
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSLog(@"layoutSubView");
    
    int column = 3;
    
    // 按鈕圖片寬度
    static CGFloat btnWidth = 74;
    
    //
    CGFloat selfWidth = self.bounds.size.width;
    CGFloat margin = (selfWidth - btnWidth * column) / (column + 1);
    
    for (int i = 0; i < self.subviews.count; i ++)
    {
        UIButton *btn = self.subviews[i];
        
        CGFloat currentColumn = i % column;
        CGFloat currentRow = i / column;
        
        CGFloat x = margin + (btnWidth + margin) * currentColumn;
        CGFloat y = margin + (btnWidth + margin) * currentRow;
        
        btn.frame = CGRectMake(x, y, btnWidth, btnWidth);
    }
    
}

- (void)drawRect:(CGRect)rect
{
    if(self.selectBtnArray.count)
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        for (int i = 0; i < self.selectBtnArray.count; i++)
        {
            UIButton *btn = self.selectBtnArray[i];
            
            if(i == 0)
            {
                [path moveToPoint:btn.center];
            }
            else
            {
                [path addLineToPoint:btn.center];
            }
        }
        
        [path addLineToPoint:self.curentPoint];
        
        path.lineWidth = 10;
        [path setLineJoinStyle:kCGLineJoinRound];
        [[UIColor redColor] set];
        
        [path stroke];
    }
    else
    {
        
    }
}

@end
