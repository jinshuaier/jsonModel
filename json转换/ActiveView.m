//
//  ActiveView.m
//  json转换
//
//  Created by 张艳江 on 2017/11/9.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "ActiveView.h"

@implementation ActiveView

- (void)initWithTitles:(NSArray *)titles isOpen:(BOOL)isOpen{
    
    for (int i = 0; i < titles.count; i ++) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"1"];
        [self addSubview:imageView];
        
        UILabel *titleLab = [UILabel publicLab:titles[i] textColor:[UIColor grayColor] textAlignment:NSTextAlignmentLeft size:11 numberOfLines:0];
        [self addSubview:titleLab];
        
        imageView.frame = CGRectMake(0, i * 18, 15, 15);
        titleLab.frame = CGRectMake(18 + 3, i * 18, 200, 18);
        titleLab.centerY = imageView.centerY;
        
        if (isOpen == NO) {
            if (i == 1) {
                return;
            }
        }
    }
}

@end
