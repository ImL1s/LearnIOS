//
//  FlagView.m
//  02.NationalFlag
//
//  Created by ImL1s-MacPro on 2016/10/22.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "Flag.h"
#import "FlagView.h"

@interface FlagView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITextView *txtView;

@end

@implementation FlagView

+(instancetype) flagView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"Flag" owner:nil options:nil]lastObject];
}

- (void) setFlag:(Flag *) flag
{
    self.imageView.image = [UIImage imageNamed:flag.icon];
    self.txtView.text = flag.name;
}

@end
