//
//  RateView.h
//  滑动评分
//
//  Created by 王奥东 on 16/11/22.
//  Copyright © 2016年 王奥东. All rights reserved.
//

/**
    关于对星星的相关设置与展示
 */

#import <UIKit/UIKit.h>

@interface RateView : UIView

@property(nonatomic, assign) float rate;//初始化时，应绘制的颜色
@property(nonatomic, assign) int maxRate;//星星的最大数
@property(nonatomic ,assign) float leftMargin;
@property(nonatomic, assign) float rightMargin;
@property(nonatomic, assign) float midMargin;
@property(nonatomic, assign) CGRect minImageSize;//用于计算星星的尺寸
@property(nonatomic, strong) NSMutableArray *rateViews;//星星都会放在这里

-(void)baseInit;
-(void)refresh;


@end


