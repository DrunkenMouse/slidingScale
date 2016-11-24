//
//  RateView.m
//  滑动评分
//
//  Created by 王奥东 on 16/11/22.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "RateView.h"
#import "MenuView.h"

@implementation RateView
//初始化
-(void)baseInit{
    self.rateViews = [[NSMutableArray alloc] init];
    
    self.rate = 0;
    self.maxRate = 5;
    
    self.leftMargin = 0;
    self.rightMargin = 0;
    self.midMargin = 8;
    
    
    self.minImageSize = CGRectMake(0, 0, 16, 16);
    
}



-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}



-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    //星星的尺寸
    float desireImageViewWidth = (self.frame.size.width - self.leftMargin - self.rightMargin - self.midMargin * (self.maxRate - 1)) / self.maxRate;
    
    float imageWidth = MAX(self.minImageSize.size.width, desireImageViewWidth);
    
    float imageHeight = MAX(self.frame.size.height, self.minImageSize.size.height);
    
    NSUInteger size = self.rateViews.count;
    
    UIImageView *view = NULL;
    
    //星星的排布
    for (int i = 0; i<size; i++) {
        //前三个
        if (i<3) {
            view = [self.rateViews objectAtIndex:i];
            view.frame = CGRectMake(self.leftMargin + (self.midMargin+imageWidth)*i, 50 * i, imageWidth, imageHeight);
        }else {
            //后三个
            view = [self.rateViews objectAtIndex:i];
            view.frame = CGRectMake(self.leftMargin + (self.midMargin+imageWidth)*i, 50*(size - i -1), imageWidth, imageHeight);
        }
    }
    
}

-(void)setMaxRate:(int)maxRate {
    
    _maxRate = maxRate;
    NSUInteger size = self.rateViews.count;
    MenuView *view = NULL;
    
    if (size > maxRate) {
        //星星个数超出现有的，就将后添加的移除
        for (NSUInteger i = size - 1; size >= maxRate; i--) {
            view = (MenuView *)[self.rateViews objectAtIndex:i];
            [view removeFromSuperview];
        }
        [self setNeedsLayout];
        [self refresh];
    } else {
        for (NSUInteger i = size; i < maxRate; i++) {
            view = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
            [self.rateViews addObject:view];
            [self addSubview:view];
        }
        [self setNeedsLayout];
        [self refresh];
    }
    
}



-(void)setRate:(float)rate {
    _rate = rate;
    [self refresh];
}

//刷新
-(void)refresh {
    //如果值大于某个星星所在个数，则星星填充完
    //如果未到，则星星填充为0
    //如果在星星范围内，就是星星填充数
    NSUInteger size = self.rateViews.count;
    for (int i = 0; i < size; i++) {
        MenuView *view = [self.rateViews objectAtIndex:i];
        if (self.rate >= i+1) {
            view.value = 1;
        }else if (self.rate > i){
            view.value = self.rate - i;
        }else {
            view.value = 0;
        }
    }
    
}
@end
