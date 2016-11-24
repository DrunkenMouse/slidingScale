//
//  ViewController.h
//  滑动评分
//
//  Created by 王奥东 on 16/11/22.
//  Copyright © 2016年 王奥东. All rights reserved.
//  参考:     开发实战 进阶篇

#import <UIKit/UIKit.h>
@class RateView;

@interface ViewController : UIViewController{
    
    IBOutlet UISlider *slider;
    IBOutlet RateView *rateView;
}
/**
    使用HSB色彩模式，色相、饱和度、亮度与透明。
    是一种色彩模式，对应人眼角度色彩，与RGB不同在于RGB是颜色标准。
    其中色相表示的角度对应色环的颜色。
 */

@end

