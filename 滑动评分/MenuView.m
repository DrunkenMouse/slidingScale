//
//  MenuView.m
//  滑动评分
//
//  Created by 王奥东 on 16/11/22.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self fristCreateWithColor:[UIColor colorWithHue:0.5 saturation:0.9 brightness:1.0 alpha:1.0]];
    }
    return self;
}

-(void)setFrame:(CGRect)frame {

    [super setFrame:frame];
    
    CGFloat x = frame.size.width / 2;
    CGFloat y = frame.size.height / 2;
    self.radius = x < y ? x:y;
    
    [self setNeedsDisplay];
    
}



-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self fristCreateWithColor:[UIColor yellowColor]];
    }
    
    return self;
}

//初始化时的设置
-(void)fristCreateWithColor:(UIColor *)color {
    CGFloat x = self.frame.size.width / 2;
    CGFloat y = self.frame.size.height / 2;
    self.radius = x < y?x:y;
    self.value = 1;
    //与初始化的不同之处在于startColor
    self.startColor = color;
    self.backgroundColor = [UIColor clearColor];
    self.boundsColor = [UIColor blackColor];
    
    
}

//画星星
-(void)drawRect:(CGRect)rect {
    
    CGFloat centerX = rect.size.width / 2;
    CGFloat centerY = rect.size.height / 2;
    
    CGFloat r0 = self.radius * sin(18 * angle) / cos(36 * angle);//计算小圆半径r0
    
    //x1 y1 保存五角星的五个尖角
    //x2 y2 保存五角星的五个内角
    CGFloat x1[5] = {0}, y1[5] = {0}, x2[5] = {0}, y2[5] = {0};
    
    for (int i = 0; i < 5; i++) {
        
        x1[i] = centerX + self.radius * cos((90 + i * 72) * angle);//计算出大圆上的五个平均分布点的坐标
        y1[i] = centerY - self.radius * sin((90 + i * 72) * angle);
        x2[i] = centerX + r0 * cos((54 + i * 72) * angle); //计算出小圆上的五个平均分布点的坐标
        y2[i] = centerY - r0 * sin((54 + i * 72)*angle);
    }
    //根据计算的点画出星星
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef startPath = CGPathCreateMutable();
    CGPathMoveToPoint(startPath, NULL, x1[0], y1[0]);
    
    
    for (int i = 1; i < 5; i++) {
        CGPathAddLineToPoint(startPath, NULL, x2[i], y2[i]);
        CGPathAddLineToPoint(startPath, NULL, x1[i], y1[i]);

    }
    
    CGPathAddLineToPoint(startPath, NULL, x2[0], y2[0]);
    CGPathCloseSubpath(startPath);
    
    CGContextAddPath(context, startPath);
    
    CGContextSetFillColorWithColor(context, self.startColor.CGColor);
    
    CGContextSetStrokeColorWithColor(context, self.boundsColor.CGColor);
    
    CGContextStrokePath(context);
    
    
    //计算需要填充的范围
    CGRect range = CGRectMake(x1[1], 0, (x1[4] - x1[1]) * self.value, y1[2]);
    
    CGContextAddPath(context, startPath);
    CGContextClip(context);
    //填充五角星的颜色
    CGContextFillRect(context, range);
    
    CFRelease(startPath);
}


//设置值,关于星星的颜色填充
-(void)setValue:(CGFloat)value {
    if (value < 0) {
        _value = 0;
    }else if(value > 1) {
        _value = 1;
    }else {
        _value = value;
    }
    
    [self setNeedsDisplay];
}



@end
