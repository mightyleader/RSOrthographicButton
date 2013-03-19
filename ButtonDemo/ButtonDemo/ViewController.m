//
//  ViewController.m
//  ButtonDemo
//
//  Created by Rob Stearn on 19/03/2013.
//  Copyright (c) 2013 Cocoadelica. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	[_button1 setButtonColor:[UIColor greenColor]];
  [_button1 setShadowAlpha:0.3];
  [_button1 setSelectColor:[UIColor lightGrayColor]];
  
  [_button2 setButtonColor:[UIColor redColor]];
  [_button2 setShadowDrawnOffset:5];
  [_button2 setSelectColor:[UIColor purpleColor]];
  [_button2 setCornerButtonRadius:3];
  
  [_button3 setButtonColor:[UIColor blueColor]];
  [_button3 setShadowColor:[UIColor whiteColor]];
  [_button3 setShadowAlpha:0.5];
  [_button3 setCornerButtonRadius:10.0];
  [_button3 setShadowDrawnOffset:4];
  
  [_button4 setButtonColor:[UIColor yellowColor]];
  [_button4 setSelectColor:[UIColor orangeColor]];
  [_button4 setShadowColor:[UIColor purpleColor]];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
