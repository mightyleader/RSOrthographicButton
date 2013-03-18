//
//  RSOrthographicButton.m
//  Thing
//
//  Created by Rob Stearn on 18/03/2013.
//  Copyright (c) 2013 Cocoadelica. All rights reserved.
//

#import "RSOrthographicButton.h"
#import <QuartzCore/QuartzCore.h>

@interface RSOrthographicButton () {
  BOOL _isInitializing;
}
@property (nonatomic, strong) UIView    *buttonView;
@property (nonatomic, strong) UIView    *shadowView;
- (void)correctTitleAndImageAlignment:(BOOL)offset;
- (void)defaultSetup;
@end

@implementation RSOrthographicButton

- (id)initWithFrame:(CGRect)frame {
  _isInitializing = YES;
  self = [super initWithFrame:frame];
  if (self) {
    [self defaultSetup];
  }
  _isInitializing = NO;
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  _isInitializing = YES;
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self defaultSetup];
  }
  _isInitializing = NO;
  return self;
}

+ (RSOrthographicButton*)buttonWithType:(UIButtonType)type {
  return [super buttonWithType:UIButtonTypeCustom];
}

- (void)defaultSetup {
  _buttonColor = [UIColor whiteColor];
  _selectColor = [UIColor lightGrayColor];
  _shadowColor = [UIColor blackColor];
  _shadowDrawnOffset = 10;
  _shadowAlpha = 0.5;
  _cornerButtonRadius = 0;
  [self correctTitleAndImageAlignment:NO];
}

- (void)setHighlighted:(BOOL)highlighted {
  CGRect buttonRect;
  if (highlighted) {
    buttonRect = _buttonView.frame;
    buttonRect.origin = CGPointMake(_shadowDrawnOffset - 2, _shadowDrawnOffset - 2);
    [_buttonView setBackgroundColor:_selectColor];
  }
  else {
    buttonRect = CGRectMake(0, 0, self.frame.size.width - _shadowDrawnOffset, self.frame.size.height - _shadowDrawnOffset);
    [_buttonView setBackgroundColor:_buttonColor];
  }
  [_buttonView setFrame:buttonRect];
  [self correctTitleAndImageAlignment:highlighted];
  [super setHighlighted:highlighted];
}

- (void)setSelected:(BOOL)selected {
  CGRect buttonRect;
  if (selected) {
    buttonRect = _buttonView.frame;
    buttonRect.origin = CGPointMake(_shadowDrawnOffset - 2, _shadowDrawnOffset - 2);
    [_buttonView setBackgroundColor:_selectColor];
  }
  else {
    buttonRect = CGRectMake(0, 0, self.frame.size.width - _shadowDrawnOffset, self.frame.size.height - _shadowDrawnOffset);
    [_buttonView setBackgroundColor:_buttonColor];
  }
  [_buttonView setFrame:buttonRect];
  [self correctTitleAndImageAlignment:selected];
  [super setSelected:selected];
}

- (void)setShadowOffset:(NSInteger)shadowOffset {
  if (!_isInitializing) _shadowDrawnOffset = shadowOffset;
}

- (void)setButtonColor:(UIColor *)buttonColor {
  if (!_isInitializing) _buttonColor = buttonColor;
}

- (void)setShadowColor:(UIColor *)shadowColor {
  if (!_isInitializing) _shadowColor = shadowColor;
}

- (void)drawRect:(CGRect)rect {
  [super setBackgroundColor:[UIColor clearColor]];
  
  //Setup the custom drawn views
  CGRect buttonRect = CGRectMake(0, 0, rect.size.width - _shadowDrawnOffset, rect.size.height - _shadowDrawnOffset);
  CGRect shadowRect = CGRectMake(_shadowDrawnOffset, _shadowDrawnOffset, rect.size.width - _shadowDrawnOffset, rect.size.height - _shadowDrawnOffset);
  _buttonView = [[UIView alloc] initWithFrame:buttonRect];
  _shadowView = [[UIView alloc] initWithFrame:shadowRect];
  [_buttonView setBackgroundColor:_buttonColor];
  [_shadowView setBackgroundColor:_shadowColor];
  [_shadowView setAlpha:_shadowAlpha];
  [_buttonView.layer setCornerRadius:_cornerButtonRadius];
  [_shadowView.layer setCornerRadius:_cornerButtonRadius];
  
  //otherwise they interfere with the buttons normal touch event receiving.
  [_buttonView setUserInteractionEnabled:NO]; 
  [_shadowView setUserInteractionEnabled:NO];
  
  [self addSubview:_shadowView];
  [self addSubview:_buttonView];
  [self bringSubviewToFront:self.titleLabel];
  [self bringSubviewToFront:self.imageView];
  [self correctTitleAndImageAlignment:NO];
}

- (void)correctTitleAndImageAlignment:(BOOL)offset {
  NSInteger negativeOffset = _shadowDrawnOffset * -1;
  CGFloat insetValue = (CGFloat)(offset?0:negativeOffset);
  [self setContentEdgeInsets:UIEdgeInsetsMake(insetValue, insetValue, 0, 0)];
}


@end
