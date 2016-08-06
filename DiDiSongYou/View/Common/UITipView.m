//
//  UITipView.m
//  UnifiedC
//
//  Created by lipeng on 13-9-9.
//  Copyright (c) 2013年 liwei. All rights reserved.
//

#import "UITipView.h"
#import "MdStyle.h"
#import <QuartzCore/CALayer.h>
#define tipFont [UIFont systemFontOfSize:17]

#define UI_SHOW_TIP_TAG 20000

@interface UITipView()

/**
 *  关闭计时器
 */
@property (strong, nonatomic) NSTimer *theTimer;

@end

@implementation UITipView{
    
    /**
        提示显示控件
     */
    UILabel *_tipLabel;
}
@synthesize theTimer;

+ (void)showTip:(NSString*)tip andStyle:(int)style
{
    
    [UITipView showTip:tip withWaitTime:2.8 andStyle:style];
}

+ (void)showTip:(NSString*)tip
{
    [UITipView showTip:tip withWaitTime:2.8];
}

+ (void)showTip:(NSString*)tip delay:(NSTimeInterval)delayTime
{
    [UITipView showTip:tip delay:delayTime withWaitTime:2.8];
}

+ (void)showTip:(NSString *)tip withWaitTime:(NSInteger)waitTime{
    [self showTip:tip withWaitTime:waitTime andStyle:0];
}

+ (void)showTip:(NSString*)tip withWaitTime:(NSInteger)waitTime andStyle:(int)style
{
    __block NSString *__tip = [tip copy];
    __block NSInteger __waitTime = waitTime;
    dispatch_async( dispatch_get_main_queue(), ^{
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        //保证某一时刻只显示1个提示框
        UITipView *tipView = (UITipView*)[window viewWithTag:UI_SHOW_TIP_TAG];
        if (tipView) {
            [tipView clear];
        }
        
        CGSize size = [tip sizeWithFont:tipFont constrainedToSize:CGSizeMake(220, 220)];
        CGRect rect = window.bounds;
        //以下为本人更改
        if (style == 1 || style == 2) {
            CGRect halfrect = rect;
            halfrect.size.height = rect.size.height * 1.7;
            rect = halfrect;
        }

        //以上为本人更改
        rect.origin.x = (rect.size.width - (size.width + 20))/2;
        rect.origin.y = (rect.size.height - (size.height+20))/2;
        
        if (style == 1) {
            rect.size.width = size.width+40;
            rect.size.height = size.height+25;
        }else{
            rect.size.width = size.width+20;
            rect.size.height = size.height+20;
        }
        
        tipView = [[UITipView alloc] initWithFrame:rect andStyle:style] ;
        tipView.tag = UI_SHOW_TIP_TAG;
        tipView.tipMessage = __tip;
        tipView.displayTime = __waitTime;//2.8;
        tipView.layer.cornerRadius = 8;
        tipView.layer.masksToBounds = YES;
        tipView.alpha = 0.0f;
        tipView.transform = CGAffineTransformMakeScale(0.7, 0.7);
        
        [window addSubview:tipView];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        tipView.alpha = 0.9f;
        tipView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        [UIView commitAnimations];
        
        
    });
}

+ (void)showTip:(NSString*)tip delay:(NSTimeInterval)delayTime withWaitTime:(NSInteger)waitTime
{
    __block NSString *__tip = [tip copy];
    __block NSInteger __waitTime = waitTime;
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        sleep(delayTime);
        dispatch_async( dispatch_get_main_queue(), ^{

            [UITipView showTip:__tip withWaitTime:__waitTime];
        });
    });
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        [self createTipView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andStyle:(int)style
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        [self createTipViewAndStyle:style];
    }
    return self;
}

- (UITipView*)initWithMessage:(NSString*)message displayTime:(NSInteger)sec
{
    self = [super init];
    if ( self ){
        self.tipMessage = message;
        self.displayTime = sec;
        
        [self createTipView];
    }
    return self;
}

- (void)dealloc
{
    self.tipMessage = nil;
    [self.theTimer invalidate];
}


#pragma -mark  在这里更改颜色
- (void)createTipView
{
    self.backgroundColor = [UIColor greenColor];
    UIFont *font = tipFont;
    _tipLabel = [[UILabel alloc] initWithFrame:self.bounds] ;
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    _tipLabel.numberOfLines = 0;
    [_tipLabel setFont:font];https://www.google.com/search?client=safari&rls=en&q=iOS%E9%AA%8C%E8%AF%81%E6%89%8B%E6%9C%BA%E5%8F%B7%E7%A0%81&ie=UTF-8&oe=UTF-8
    [_tipLabel setTextColor:[UIColor whiteColor]];
    _tipLabel.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_tipLabel];

}

- (void)createTipViewAndStyle:(int)style
{
    if (style == 1) {
        self.backgroundColor = ACOLOR;
    }else{
        self.backgroundColor = [UIColor blackColor];
    }
    UIFont *font = tipFont;
    _tipLabel = [[UILabel alloc] initWithFrame:self.bounds] ;
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    _tipLabel.numberOfLines = 0;
    [_tipLabel setFont:font];https://www.google.com/search?client=safari&rls=en&q=iOS%E9%AA%8C%E8%AF%81%E6%89%8B%E6%9C%BA%E5%8F%B7%E7%A0%81&ie=UTF-8&oe=UTF-8
    [_tipLabel setTextColor:[UIColor whiteColor]];
    _tipLabel.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_tipLabel];
    
}

- (void)layoutSubviews
{
    CGRect rect = self.bounds;
    rect = CGRectOffset(rect, 10, 10);
    rect.size.width -= 20;
    rect.size.height -= 20;
    _tipLabel.frame = rect;
}

- (void)didMoveToSuperview
{
    [_tipLabel setText:self.tipMessage];
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:self.displayTime target:self selector:@selector(timer:) userInfo:nil repeats:NO];
}

- (void)timer:(NSTimer*)theTimer
{
    dispatch_async( dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 animations:^(){
            self.alpha = 0.0f;
            self.transform = CGAffineTransformMakeScale(0.7, 0.7);
        }completion:^(BOOL finised){
            [self removeFromSuperview];
        }];
    });
    
}
- (void)clear
{
    [self.theTimer fire];
    self.theTimer = nil;
}

@end
