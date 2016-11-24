//
//  MenuView.h
//  滑动评分
//
//  Created by 王奥东 on 16/11/22.
//  Copyright © 2016年 王奥东. All rights reserved.
//

/**
    关于星星的View
    每个星星都是画出来的，包括填充颜色
    value值是关于星星的填充色填充比例
    星星的比例是通过画圆计算出外五个尖角、内五个尖角与尖角的角度进行绘制
    星星的大小是自身宽高取小值
 */

#import <UIKit/UIKit.h>

//角度
#define angle M_PI/180

@interface MenuView : UIView

@property(nonatomic, assign) CGFloat radius;//星星的半径
@property(nonatomic, assign) CGFloat value;//范围从0到1
//五角星的填充颜色
@property(nonatomic, strong) UIColor *startColor;
//五角星的边缘颜色
@property(nonatomic, strong) UIColor *boundsColor;


@end

