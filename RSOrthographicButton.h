//
//  RSOrthographicButton.h
//  Thing
//
//  Created by Rob Stearn on 18/03/2013.
//  Copyright (c) 2013 Cocoadelica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RSOrthographicButton : UIButton

@property (nonatomic)         NSInteger shadowDrawnOffset UI_APPEARANCE_SELECTOR;
@property (nonatomic)         CGFloat   shadowAlpha  UI_APPEARANCE_SELECTOR;
@property (nonatomic)         NSInteger cornerButtonRadius UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor   *buttonColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor   *selectColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor   *shadowColor UI_APPEARANCE_SELECTOR;

@end
