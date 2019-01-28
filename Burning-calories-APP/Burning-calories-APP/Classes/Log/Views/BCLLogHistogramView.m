//
//  BCLLogHistogramView.m
//  折线图
//
//  Created by 强淑婷 on 2019/1/27.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "BCLLogHistogramView.h"

#define MARGIN  15

#define Y_EVERY_MARGIN    10

// 颜色RGB
#define XYQColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define XYQColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色
#define XYQRandomColor  XYQColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


@implementation BCLLogHistogramView
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:backView];
        
        self.myFrame = frame;
    }
    return self;
}
-(void)drawXYLine:(NSMutableArray *)x_names AdddistanceValues:(NSInteger )adddistance StartingValues:(NSInteger)starting ProportionValuess:(NSInteger)proportion{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //1.Y轴、X轴的直线
    [path moveToPoint:CGPointMake(MARGIN + adddistance, CGRectGetHeight(_myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+adddistance, MARGIN)];
    
    [path moveToPoint:CGPointMake(MARGIN+adddistance, CGRectGetHeight(_myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN+adddistance, CGRectGetHeight(_myFrame)-MARGIN)];
    
    //2.添加箭头
    [path moveToPoint:CGPointMake(MARGIN+adddistance, MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN-5+adddistance, MARGIN+5)];
    [path moveToPoint:CGPointMake(MARGIN+adddistance, MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+5+adddistance, MARGIN+5)];
    
    [path moveToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN+adddistance, CGRectGetHeight(_myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN-5+adddistance, CGRectGetHeight(_myFrame)-MARGIN-5)];
    [path moveToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN+adddistance, CGRectGetHeight(_myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN-5+adddistance, CGRectGetHeight(_myFrame)-MARGIN+5)];
    
    //3.添加索引格
    //X轴
    for (int i=0; i<x_names.count; i++) {
        CGFloat X = MARGIN + MARGIN*(i+1);
        CGPoint point = CGPointMake(X+adddistance,CGRectGetHeight(_myFrame)-MARGIN);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x, point.y - 3)];
    }
    //Y轴（实际长度为200,此处比例缩小一倍使用）
    for (int i=0; i<11; i++) {
        CGFloat Y = CGRectGetHeight(_myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        CGPoint point = CGPointMake(MARGIN+adddistance,Y);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x+3, point.y)];
    }
    
    //4.添加索引格文字
    //X轴
    for (int i=0; i<x_names.count+1; i++) {
        CGFloat X = MARGIN + 15 + MARGIN*i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(X+adddistance, CGRectGetHeight(_myFrame)-MARGIN, MARGIN, 20)];
        if(i < x_names.count){
            textLabel.text = x_names[i];
        }
        else{
            textLabel.text = @"年/月";
        }
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor blueColor];
        [self addSubview:textLabel];
        
    }
    
    //Y轴
    for (int i=0; i<11; i++) {
        CGFloat Y = CGRectGetHeight(_myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Y-5, MARGIN+adddistance, 10)];
        textLabel.text = [NSString stringWithFormat:@"%ld",starting+proportion*10*i];
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor redColor];
        [self addSubview:textLabel];
    }
    
    //5.渲染路径
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.borderWidth = 2.0;
    [self.subviews[0].layer addSublayer:shapeLayer];
}
-(void)drawBarChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues AdddistanceValues:(NSInteger )adddistance  StartingValues:(NSInteger)starting ProportionValuess:(NSInteger)proportion{
    
    //1.画坐标轴
    
    [self drawXYLine:x_names AdddistanceValues:adddistance StartingValues:starting ProportionValuess:proportion];
    NSMutableArray * targetValues1 =[[NSMutableArray alloc]init];
    for (int i=0; i<targetValues.count; i++  ){
        CGFloat coed =[targetValues[i] integerValue];
        [targetValues1 addObject:@((coed-starting)/proportion)];
        
    }
    //2.每一个目标值点坐标
    for (int i=0; i<targetValues1.count; i++) {
        CGFloat doubleValue = 2*[targetValues1[i] floatValue]; //目标值放大两倍
        CGFloat X = MARGIN + MARGIN*(i+1)+5;
        CGFloat Y = CGRectGetHeight(_myFrame)-MARGIN-doubleValue;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(X-MARGIN/2+adddistance, Y, MARGIN-10, doubleValue)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
        shapeLayer.fillColor = XYQRandomColor.CGColor;
        shapeLayer.borderWidth = 2.0;
        [self.subviews[0].layer addSublayer:shapeLayer];
        
        //3.添加文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(X-MARGIN/2, Y-20, MARGIN-10+adddistance*2, 20)];
        label.text = [NSString stringWithFormat:@"%.0lf",starting+proportion*(CGRectGetHeight(_myFrame)-Y-MARGIN)/2];
        label.textColor = [UIColor purpleColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        [self.subviews[0] addSubview:label];
    }
}
-(void)drawXYLine:(NSMutableArray *)x_names{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //1.Y轴、X轴的直线
    [path moveToPoint:CGPointMake(MARGIN, CGRectGetHeight(_myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN, MARGIN)];
    
    [path moveToPoint:CGPointMake(MARGIN, CGRectGetHeight(_myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN, CGRectGetHeight(_myFrame) - MARGIN)];
    
    //2.添加箭头
    [path moveToPoint:CGPointMake(MARGIN, MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN-5, MARGIN+5)];
    [path moveToPoint:CGPointMake(MARGIN, MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+5, MARGIN+5)];
    
    [path moveToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN, CGRectGetHeight(_myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN-5, CGRectGetHeight(_myFrame)-MARGIN-5)];
    [path moveToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN, CGRectGetHeight(_myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(_myFrame)-2*MARGIN-5, CGRectGetHeight(_myFrame)-MARGIN+5)];
    
    //3.添加索引格
    //X轴
    for (int i=0; i<x_names.count; i++) {
        CGFloat X = MARGIN + MARGIN * (i + 1);
        CGPoint point = CGPointMake(X,CGRectGetHeight(_myFrame) - MARGIN);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x, point.y-3)];
    }
    //Y轴（实际长度为200,此处比例缩小一倍使用）
    for (int i=0; i<11; i++) {
        CGFloat Y = CGRectGetHeight(_myFrame)-MARGIN-Y_EVERY_MARGIN * i;
        CGPoint point = CGPointMake(MARGIN,Y);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x+3, point.y)];
    }
    
    //4.添加索引格文字
    //X轴
    for (int i=0; i<x_names.count; i++) {
        CGFloat X = MARGIN + 15 + MARGIN*i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(X, CGRectGetHeight(_myFrame)-MARGIN, MARGIN, 20)];
        if(i < x_names.count) {
            textLabel.text = x_names[i];
        } else {
            textLabel.text = @"月";
        }
        
        textLabel.font = [UIFont systemFontOfSize:5];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor blueColor];
        [self addSubview:textLabel];
    }
    //Y轴
    for (int i=0; i<11; i++) {
        CGFloat Y = CGRectGetHeight(_myFrame)- MARGIN -Y_EVERY_MARGIN * i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Y-5, MARGIN, 10)];
        textLabel.text = [NSString stringWithFormat:@"%d",10*i];
        textLabel.font = [UIFont systemFontOfSize:8];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor redColor];
        [self addSubview:textLabel];
    }
    
    //5.渲染路径
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.borderWidth = 2.0;
    [self.subviews[0].layer addSublayer:shapeLayer];
}
-(void)drawBarChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues{
    
    //1.画坐标轴
    [self drawXYLine:x_names];
    
    //2.每一个目标值点坐标
    for (int i=0; i<targetValues.count; i++) {
        CGFloat doubleValue = 2*[targetValues[i] floatValue]; //目标值放大两倍
        CGFloat X = MARGIN + MARGIN*(i+1)+5;
        CGFloat Y = CGRectGetHeight(_myFrame)-MARGIN-doubleValue;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(X-MARGIN/2, Y, MARGIN-10, doubleValue)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
        shapeLayer.fillColor = XYQRandomColor.CGColor;
        shapeLayer.borderWidth = 1.0;
        [self.subviews[0].layer addSublayer:shapeLayer];
        
        //3.添加文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(X-MARGIN/2, Y-20, MARGIN-10, 20)];
        label.text = [NSString stringWithFormat:@"%.0lf",(CGRectGetHeight(_myFrame)-Y-MARGIN)/2];
        label.textColor = [UIColor purpleColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:3];
        [self.subviews[0] addSubview:label];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
