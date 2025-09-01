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


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 先画描边
    NSDictionary *strokeAttr = @{
        NSFontAttributeName : self.font,
        NSStrokeColorAttributeName : [UIColor whiteColor],   // 描边颜色
        NSStrokeWidthAttributeName : @(-3.0),               // 负数 = 描边 + 填充
    };
    [self.text drawInRect:self.bounds withAttributes:strokeAttr];

    // 再画填充（填充色先随便，后面会被 mask 替换成渐变）
    NSDictionary *fillAttr = @{
        NSFontAttributeName : self.font,
        NSForegroundColorAttributeName : [UIColor whiteColor]
    };
    [self.text drawInRect:self.bounds withAttributes:fillAttr];

    // 用文字生成 mask
    CGImageRef dhtmlMask = CGBitmapContextCreateImage(context);
    
    CGContextClearRect(context, rect);
    
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToMask(context, rect, dhtmlMask);
    



    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0, 1};
    NSArray *colors = @[(__bridge id)[UIColor colorWithHexString:@"#F23055"].CGColor,
                        (__bridge id)[UIColor colorWithHexString:@"#FFD06C"].CGColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    CGPoint start = CGPointMake(self.bounds.size.width / 2.0, 0);
    CGPoint end = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height);
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation);
    
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    CGImageRelease(dhtmlMask);
}

@end
