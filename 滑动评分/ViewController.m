//
//  ViewController.m
//  滑动评分
//
//  Created by 王奥东 on 16/11/22.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "RateView.h"
#import "MenuView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    rateView.rate = 1;
    slider.value = 1;

}


- (IBAction)sliderValueChange:(id)sender {
    
     rateView.rate = slider.value;
}

@end
