//
//  GradientTextLabel.m
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

#import "GradientTextLabel.h"
#import <YYKit/UIColor+YYAdd.h>

@interface GradientTextLabel ()

@property (nonatomic, strong) CAGradientLayer *babacooteClayer;

@end

@implementation GradientTextLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // === 先画文字到一个独立 context，用来生成 mask ===
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGContextRef maskContext = UIGraphicsGetCurrentContext();
    
    // 画描边+填充
//    NSDictionary *textAttr = @{
//        NSFontAttributeName : self.font,
//        NSStrokeColorAttributeName : [UIColor whiteColor],
//        NSStrokeWidthAttributeName : @(-3.0), // 负数=描边+填充
//        NSForegroundColorAttributeName : [UIColor whiteColor]
//    };
//    [self.text drawInRect:self.bounds withAttributes:textAttr];
    
    // === 1. 描边 ===
    NSDictionary *strokeAttr = @{
        NSFontAttributeName: self.font,
        NSStrokeColorAttributeName: [UIColor whiteColor],
        NSStrokeWidthAttributeName: @(-3.0) // 正数，只描边
    };
    [self.text drawInRect:self.bounds withAttributes:strokeAttr];
    
    // 把文字图像拿出来
    CGImageRef textMask = CGBitmapContextCreateImage(maskContext);
    UIGraphicsEndImageContext();
    
    // === 主 context 绘制渐变 ===
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToMask(context, rect, textMask);
    
    // 渐变
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0, 1};
    NSArray *colors = @[(__bridge id)[UIColor colorWithRed:0.82 green:0.3 blue:0.36 alpha:1].CGColor,
                        (__bridge id)[UIColor colorWithRed:0.36 green:0.11 blue:0.21 alpha:1].CGColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    CGPoint start = CGPointMake(0, rect.size.height/2);
    CGPoint end = CGPointMake(rect.size.width, rect.size.height/2);
    CGContextDrawLinearGradient(context, gradient, start, end, 0);
    
    // 清理
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    CGImageRelease(textMask);
}

@end
